import '../models/edge_model.dart';
import '../models/vertex_model.dart';
import 'dijkstra.dart';
import 'graph.dart';

class BuildingNavigator
{
  late Graph graph;

  BuildingNavigator(List<Edge> edges, List<Vertex> vertexes)
  {
    graph = Graph(Vertices: []);
    for(int i = 0; i < vertexes.length; ++i)
    {
      graph.AddVertex(vertexes[i].title);
    }

    for(int i = 0; i < edges.length; ++i)
    {
      graph.AddEdge(edges[i].vertex1.title, edges[i].vertex2.title, edges[i].length.toInt());
    }
  }


  List<String>? GetPath(String source, String destination)
  {
    var dijkstra = Dijkstra(graph: graph);
    return dijkstra.FindShortestPathString(source, destination);
  }
}