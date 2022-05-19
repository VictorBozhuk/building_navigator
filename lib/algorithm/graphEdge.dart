import 'graphVertex.dart';

class GraphEdge
{
  GraphVertex ConnectedVertex;

  int EdgeWeight;

  GraphEdge(this.ConnectedVertex, this.EdgeWeight);
}