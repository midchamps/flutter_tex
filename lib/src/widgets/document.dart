import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_tex/src/models/widget_meta.dart';
import 'package:flutter_tex/src/utils/style_utils.dart';

enum TagType { div, p }

class TeXViewDocument extends TeXViewWidget {
  /// Raw String containing HTML and TEX Code e.g. r"""$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$<br> """
  final String data;

  final TagType type;

  final Node node;

  /// Style TeXView Widget with [TeXViewStyle].
  final TeXViewStyle? style;

  const TeXViewDocument(
    this.data, {
    this.style,
    this.type = TagType.div,
    this.node = Node.leaf,
  });

  @override
  TeXViewWidgetMeta meta() {
    return TeXViewWidgetMeta(
      tag: type.name,
      classList: 'tex-view-document',
      node: node,
    );
  }

  @override
  Map toJson() => {
        'meta': meta().toJson(),
        'data': data,
        'style': style?.initStyle() ?? teXViewDefaultStyle,
      };
}
