import '../models/edge_model.dart';
import '../models/vertex_model.dart';
import 'dijkstra.dart';
import 'graph.dart';

class PathFinder
{
  late Graph graph;

  PathFinder(List<Edge> edges, List<Vertex> vertexes)
  {
    graph = Graph(vertexes: []);
    for(int i = 0; i < vertexes.length; ++i)
    {
      graph.AddVertex(vertexes[i].id);
    }

    for(int i = 0; i < edges.length; ++i)
    {
      graph.AddEdge(edges[i].vertexId1, edges[i].vertexId2, edges[i].length.toInt());
    }
  }

  List<String>? GetPath(String sourceId, String destinationId)
  {
    var dijkstra = Dijkstra(graph: graph);
    return dijkstra.FindShortestPathString(sourceId, destinationId);
  }
}