import 'graphVertex.dart';

class Graph
{
  final List<GraphVertex> Vertices;

Graph({required this.Vertices});

void AddVertex(String vertexName)
{
  Vertices.add(new GraphVertex(vertexName, Edges: []));
}

GraphVertex? FindVertex(String vertexName)
{
  for(int i = 0 ; i < Vertices.length; ++i)
    {
      if (Vertices[i].Name == vertexName)
      {
        return Vertices[i];
      }
    }

  return null;
}

void AddEdge(String firstName, String secondName, int weight)
{
  var v1 = FindVertex(firstName);
  var v2 = FindVertex(secondName);
  if (v2 != null && v1 != null)
  {
    v1.AddEdgeWithWeight(v2, weight);
    v2.AddEdgeWithWeight(v1, weight);
  }
}
}