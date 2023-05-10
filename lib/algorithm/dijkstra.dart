

import 'graph.dart';
import 'graphVertex.dart';
import 'graphVertexInfo.dart';

class Dijkstra
{
  final Graph graph;
  late List<GraphVertexInfo> infos;

  Dijkstra({required this.graph});

  void InitInfo()
  {
    infos = [];
    for(int i = 0; i < graph.vertexes.length; ++i)
    {
      infos.add(GraphVertexInfo(graph.vertexes[i]));
    }
  }

  GraphVertexInfo? GetVertexInfo(GraphVertex? v)
  {
    for(int i = 0; i < infos.length; ++i)
    {
      if (infos[i].Vertex == v)
      {
        return infos[i];
      }
    }

    return null;
  }

  GraphVertexInfo? FindUnvisitedVertexWithMinSum()
  {
    var minValue = 999999999;
    GraphVertexInfo? minVertexInfo;
    for(int i = 0; i < infos.length; ++i)
    {
      if (infos[i].IsUnvisited && infos[i].EdgesWeightSum < minValue)
      {
        minVertexInfo = infos[i];
        minValue = infos[i].EdgesWeightSum;
      }
    }

    return minVertexInfo;
  }

  List<String>? FindShortestPathString(String startName, String finishName)
  {
    return FindShortestPath(graph.FindVertex(startName), graph.FindVertex(finishName));
  }

  List<String>? FindShortestPath(GraphVertex? startVertex, GraphVertex? finishVertex)
  {
    InitInfo();
    var first = GetVertexInfo(startVertex);
    first?.EdgesWeightSum = 0;
    while (true)
    {
      var current = FindUnvisitedVertexWithMinSum();
      if (current == null)
      {
        break;
      }

      SetSumToNextVertex(current);
    }

    return GetPath(startVertex!, finishVertex);
  }

  void SetSumToNextVertex(GraphVertexInfo info)
  {
    info.IsUnvisited = false;
    for(int i = 0; i < info.Vertex.Edges.length; ++i)
      {
        var nextInfo = GetVertexInfo(info.Vertex.Edges[i].ConnectedVertex);
        var sum = info.EdgesWeightSum + info.Vertex.Edges[i].EdgeWeight;
        int weightSum = nextInfo?.EdgesWeightSum ?? 0;
        if (sum < weightSum)
        {
          nextInfo?.EdgesWeightSum = sum;
          nextInfo?.PreviousVertex = info.Vertex;
        }
      }
  }

  List<String> GetPath(GraphVertex startVertex, GraphVertex? endVertex)
  {
    var vertexes = [ endVertex?.ToString()];
    while (startVertex != endVertex)
    {
      var t = GetVertexInfo(endVertex);
      endVertex = GetVertexInfo(endVertex)?.PreviousVertex!;
      vertexes.add(endVertex?.ToString());
    }

    return List.from(vertexes.reversed);
  }
}