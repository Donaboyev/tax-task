library flappy_search_bar;

import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tax_task/core/custom_widgets/flappy_search_bar/scaled_tile.dart';
import 'package:tax_task/core/theme/app_colors.dart';

import 'search_bar_style.dart';

mixin _ControllerListener<T> on State<SearchBar<T>> {
  void onListChanged(List<T> items) {}

  void onLoading() {}

  void onClear() {}

  void onError(Error error) {}
}

class SearchBarController<T> {
  final List<T> _list = [];
  final List<T> _filteredList = [];
  final List<T> _sortedList = [];
  TextEditingController? _searchQueryController;
  String? _lastSearchedText;
  Future<List<T>> Function(String text)? _lastSearchFunction;
  _ControllerListener? _controllerListener;
  int Function(T a, T b)? _lastSorting;
  CancelableOperation? _cancelableOperation;
  int? minimumChars;

  void setTextController(
      TextEditingController _searchQueryController, minimunChars) {
    this._searchQueryController = _searchQueryController;
    this.minimumChars = minimunChars;
  }

  void setListener(_ControllerListener _controllerListener) {
    this._controllerListener = _controllerListener;
  }

  void clear() {
    _controllerListener?.onClear();
  }

  void _search(
      String text, Future<List<T>> Function(String text) onSearch) async {
    _controllerListener?.onLoading();
    try {
      if (_cancelableOperation != null &&
          (!_cancelableOperation!.isCompleted ||
              !_cancelableOperation!.isCanceled)) {
        _cancelableOperation!.cancel();
      }
      _cancelableOperation = CancelableOperation.fromFuture(
        onSearch(text),
        onCancel: () => {},
      );

      final List<T> items = await _cancelableOperation!.value;
      _lastSearchFunction = onSearch;
      _lastSearchedText = text;
      _list.clear();
      _filteredList.clear();
      _sortedList.clear();
      _lastSorting = null;
      _list.addAll(items);
      _controllerListener?.onListChanged(_list);
    } catch (error) {
      _controllerListener?.onError(error as Error);
    }
  }

  void injectSearch(
      String? searchText, Future<List<T>> Function(String text) onSearch) {
    if (searchText != null && searchText.length >= minimumChars!) {
      _searchQueryController!.text = searchText;
      _search(searchText, onSearch);
    }
  }

  void replayLastSearch() {
    if (_lastSearchFunction != null && _lastSearchedText != null) {
      _search(_lastSearchedText!, _lastSearchFunction!);
    }
  }

  void removeFilter() {
    _filteredList.clear();
    if (_lastSorting == null) {
      _controllerListener?.onListChanged(_list);
    } else {
      _sortedList.clear();
      _sortedList.addAll(List<T>.from(_list));
      _sortedList.sort(_lastSorting);
      _controllerListener?.onListChanged(_sortedList);
    }
  }

  void removeSort() {
    _sortedList.clear();
    _lastSorting = null;
    _controllerListener
        ?.onListChanged(_filteredList.isEmpty ? _list : _filteredList);
  }

  void sortList(int Function(T a, T b) sorting) {
    _lastSorting = sorting;
    _sortedList.clear();
    _sortedList
        .addAll(List<T>.from(_filteredList.isEmpty ? _list : _filteredList));
    _sortedList.sort(sorting);
    _controllerListener?.onListChanged(_sortedList);
  }

  void filterList(bool Function(T item) filter) {
    _filteredList.clear();
    _filteredList.addAll(_sortedList.isEmpty
        ? _list.where(filter).toList()
        : _sortedList.where(filter).toList());
    _controllerListener?.onListChanged(_filteredList);
  }
}

/// Signature for a function that creates [ScaledTile] for a given index.
typedef ScaledTile IndexedScaledTileBuilder(int index);

class SearchBar<T> extends StatefulWidget {
  /// Future returning searched items
  final Future<List<T>> Function(String text)? onSearch;

  /// List of items showed by default
  final List<T> suggestions;

  final VoidCallback? onNotificationTap;

  /// Callback returning the widget corresponding to a Suggestion item
  final Widget Function(T item, int index)? buildSuggestion;

  /// Minimum number of chars required for a search
  final int minimumChars;

  /// Callback returning the widget corresponding to an item found
  final Widget Function(T item, int index) onItemFound;

  /// Callback returning the widget corresponding to an Error while searching
  final Widget Function(Error error)? onError;

  /// Cooldown between each call to avoid too many
  final Duration debounceDuration;

  /// Widget to show when loading
  final Widget loader;

  /// Widget to show when no item were found
  final Widget emptyWidget;

  /// Widget to show by default
  final Widget? placeHolder;

  /// Widget showed on left of the search bar
  final Widget icon;

  /// Widget placed between the search bar and the results
  final Widget? header;

  /// Hint text of the search bar
  final String hintText;

  /// TextStyle of the hint text
  final TextStyle hintStyle;

  /// Color of the icon when search bar is active
  final Color iconActiveColor;

  /// Text style of the text in the search bar
  final TextStyle textStyle;

  /// Widget shown for cancellation
  final Widget cancellationWidget;

  /// Callback when cancel button is triggered
  final VoidCallback? onCancelled;

  /// Controller used to be able to sort, filter or replay the search
  final SearchBarController? searchBarController;

  /// Enable to edit the style of the search bar
  final SearchBarStyle searchBarStyle;

  /// Number of items displayed on cross axis
  final int crossAxisCount;

  /// Weather the list should take the minimum place or not
  final bool shrinkWrap;

  /// Called to get the tile at the specified index for the
  /// [SliverGridStaggeredTileLayout].
  final IndexedScaledTileBuilder? indexedScaledTileBuilder;

  /// Set the scrollDirection
  final Axis scrollDirection;

  /// Spacing between tiles on main axis
  final double mainAxisSpacing;

  /// Spacing between tiles on cross axis
  final double crossAxisSpacing;

  /// Set a padding on the list
  final EdgeInsetsGeometry listPadding;

  SearchBar({
    Key? key,
    required this.onSearch,
    required this.onItemFound,
    this.fromMap = false,
    this.searchBarController,
    this.minimumChars = 1,
    this.debounceDuration = const Duration(milliseconds: 500),
    this.loader = const Center(child: CircularProgressIndicator()),
    this.onError,
    this.emptyWidget = const SizedBox.shrink(),
    this.header,
    this.placeHolder,
    this.icon = const Icon(Icons.search, color: clrGray),
    this.hintText = "",
    this.hintStyle = const TextStyle(color: clrAssets),
    this.iconActiveColor = Colors.black,
    this.textStyle = const TextStyle(color: Colors.black),
    this.cancellationWidget = const Text("Cancel"),
    this.onCancelled,
    this.suggestions = const [],
    this.buildSuggestion,
    this.searchBarStyle = const SearchBarStyle(),
    this.crossAxisCount = 1,
    this.shrinkWrap = false,
    this.indexedScaledTileBuilder,
    this.scrollDirection = Axis.vertical,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.listPadding = const EdgeInsets.all(0),
    this.onNotificationTap,
  }) : super(key: key);

  final bool fromMap;

  @override
  _SearchBarState createState() => _SearchBarState<T>();
}

class _SearchBarState<T> extends State<SearchBar<T>>
    with TickerProviderStateMixin, _ControllerListener<T> {
  bool _loading = false;
  Widget? _error;
  final _searchQueryController = TextEditingController();
  Timer? _debounce;
  bool _animate = false;
  List<T> _list = [];
  SearchBarController? searchBarController;

  @override
  void initState() {
    super.initState();
    searchBarController =
        widget.searchBarController ?? SearchBarController<T>();
    searchBarController!.setListener(this);
    searchBarController!
        .setTextController(_searchQueryController, widget.minimumChars);
  }

  @override
  void onListChanged(List<T> items) {
    setState(() {
      _loading = false;
      _list = items;
    });
  }

  @override
  void onLoading() {
    setState(() {
      _loading = true;
      _error = null;
      _animate = true;
    });
  }

  @override
  void onClear() {
    _cancel();
  }

  @override
  void onError(Error error) {
    setState(() {
      _loading = false;
      _error = widget.onError != null ? widget.onError!(error) : Text("error");
    });
  }

  _onTextChanged(String newText) async {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(widget.debounceDuration, () async {
      if (newText.length >= widget.minimumChars && widget.onSearch != null) {
        searchBarController!._search(newText, widget.onSearch!);
      } else {
        setState(() {
          _list.clear();
          _error = null;
          _loading = false;
          _animate = false;
        });
      }
    });
  }

  void _cancel() {
    if (widget.onCancelled != null) {
      FocusScope.of(context).requestFocus(FocusNode());
      widget.onCancelled!();
    }

    setState(() {
      _searchQueryController.clear();
      _list.clear();
      _error = null;
      _loading = false;
      _animate = false;
    });
  }

  Widget _buildListView(
      List<T> items, Widget Function(T item, int index) builder) {
    return ListView(
      padding: widget.listPadding,
      physics: BouncingScrollPhysics(),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: clrWhite,
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: widget.crossAxisCount,
              itemCount: items.length,
              shrinkWrap: widget.shrinkWrap,
              staggeredTileBuilder: widget.indexedScaledTileBuilder ??
                  (int index) => ScaledTile.fit(1),
              scrollDirection: widget.scrollDirection,
              mainAxisSpacing: widget.mainAxisSpacing,
              crossAxisSpacing: widget.crossAxisSpacing,
              addAutomaticKeepAlives: true,
              itemBuilder: (BuildContext context, int index) {
                return builder(items[index], index);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget? _buildContent(BuildContext context) {
    if (_error != null) {
      return _error;
    } else if (_loading) {
      return widget.loader;
    } else if (_searchQueryController.text.length < widget.minimumChars) {
      if (widget.placeHolder != null) return widget.placeHolder;
      return _buildListView(
          widget.suggestions, widget.buildSuggestion ?? widget.onItemFound);
    } else if (_list.isNotEmpty) {
      return _buildListView(_list, widget.onItemFound);
    } else {
      return widget.emptyWidget;
    }
  }

  @override
  Widget build(BuildContext context) {
    final widthMax = MediaQuery.of(context).size.width;
    return !widget.fromMap
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: clrWhite,
                  border: Border(
                    bottom: BorderSide(color: clrInactive, width: 1),
                  ),
                ),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: SizedBox(
                  height: 48,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: _animate ? widthMax * .8 : widthMax * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: widget.searchBarStyle.borderRadius,
                            color: widget.searchBarStyle.backgroundColor,
                          ),
                          child: TextField(
                            controller: _searchQueryController,
                            onChanged: _onTextChanged,
                            style: widget.textStyle,
                            decoration: InputDecoration(
                              icon: Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: widget.icon,
                              ),
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: widget.hintText,
                              hintStyle: widget.hintStyle,
                              contentPadding: EdgeInsets.zero,
                            ),
                            scrollPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: _cancel,
                        child: Visibility(
                          visible: _animate,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: widget.cancellationWidget,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: false,
                        child: IconButton(
                          iconSize: 24,
                          icon: Icon(Icons.doorbell),
                          onPressed: widget.onNotificationTap,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: _buildContent(context)!,
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 48,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: _animate ? widthMax * .8 : widthMax,
                        decoration: BoxDecoration(
                          borderRadius: widget.searchBarStyle.borderRadius,
                          color: widget.searchBarStyle.backgroundColor,
                        ),
                        child: TextField(
                          controller: _searchQueryController,
                          onChanged: _onTextChanged,
                          style: widget.textStyle,
                          decoration: InputDecoration(
                              icon: widget.icon,
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: widget.hintText,
                              hintStyle: widget.hintStyle,
                              contentPadding: EdgeInsets.zero),
                          scrollPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: _cancel,
                      child: Visibility(
                        visible: _animate,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: widget.cancellationWidget,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: widget.header ?? SizedBox(),
              ),
              Expanded(
                child: _buildContent(context)!,
              ),
            ],
          );
  }
}
