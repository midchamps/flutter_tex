import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_tex/src/models/tex_view_group_item.dart';
import 'package:flutter_tex/src/models/tex_view_meta.dart';
import 'package:flutter_tex/src/models/tex_view_widget.dart';
import 'package:flutter_tex/src/utils/tex_view_style.dart';

class TeXViewGroup extends TeXViewWidget {
  /// A list of [TeXViewWidget].
  @required
  final List<TeXViewGroupItem> children;

  /// Style TeXView Widget with [TeXViewStyle].
  final TeXViewStyle style;

  /// Style TeXView Widget with [TeXViewStyle].
  final TeXViewStyle selectedItemStyle;

  /// Style TeXView Widget with [TeXViewStyle].
  final TeXViewStyle normalItemStyle;

  const TeXViewGroup(
      {this.children,
      this.style,
      this.selectedItemStyle,
      this.normalItemStyle});

  @override
  Map toJson() => {
        'meta': TeXViewWidgetMeta(
                tag: 'div', type: 'tex-view-group', node: Node.InternalChildren)
            .toJson(),
        'data': this.children?.map((child) => child?.toJson())?.toList(),
        'style': this.style?.initStyle() ?? teXViewDefaultStyle,
        'selectedItemStyle':
            this.selectedItemStyle?.initStyle() ?? teXViewDefaultStyle,
        'normalItemStyle':
            this.normalItemStyle?.initStyle() ?? teXViewDefaultStyle,
      };
}