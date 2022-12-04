import '../models/edge_model.dart';
import '../models/vertex_model.dart';
import 'dijkstra.dart';
import 'graph.dart';

class PathFinder
{
  late Graph graph;

  PathFinder(List<Edge> edges, List<Vertex> vertexes)
  {
    graph = Graph(Vertices: []);
    for(int i = 0; i < vertexes.length; ++i)
    {
      graph.AddVertex(vertexes[i].title.toString());
    }

    for(int i = 0; i < edges.length; ++i)
    {
      graph.AddEdge(edges[i].vertexId1, edges[i].vertexId2, edges[i].length.toInt());
    }
  }


  List<String>? GetPath(String source, String destination)
  {
    var dijkstra = Dijkstra(graph: graph);
    return dijkstra.FindShortestPathString(source, destination);
  }
}