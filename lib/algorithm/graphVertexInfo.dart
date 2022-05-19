import 'graphVertex.dart';

class GraphVertexInfo
{
  GraphVertex Vertex;
  bool IsUnvisited;
  int EdgesWeightSum;
  GraphVertex? PreviousVertex;
  GraphVertexInfo(this.Vertex, {this.IsUnvisited = true, this.EdgesWeightSum = 999999999, this.PreviousVertex});
}