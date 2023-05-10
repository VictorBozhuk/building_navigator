import 'graphVertex.dart';

class Graph
{
  final List<GraphVertex> vertexes;

Graph({required this.vertexes});

void AddVertex(String vertexName)
{
  vertexes.add(new GraphVertex(vertexName, Edges: []));
}

GraphVertex? FindVertex(String vertexName)
{
  for(int i = 0 ; i < vertexes.length; ++i)
    {
      if (vertexes[i].Name == vertexName)
      {
        return vertexes[i];
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