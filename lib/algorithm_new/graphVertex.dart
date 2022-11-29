import 'graphEdge.dart';

class GraphVertex
{
  String Name;
  final List<GraphEdge> Edges;

GraphVertex(this.Name, {required this.Edges});


void AddEdge(GraphEdge newEdge)
{
  Edges.add(newEdge);
}

void AddEdgeWithWeight(GraphVertex vertex, int edgeWeight)
{
  AddEdge(new GraphEdge(vertex, edgeWeight));
}

String ToString() => Name;
}