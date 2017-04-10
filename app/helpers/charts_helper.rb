module ChartsHelper
  
  def get_all_boxes_graph
    line_chart get_all_boxes_graph_path, height: '100%', library: {
      title: {text: 'Níveis x Tempo', x: 0},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Nível'
         }
      },
      xAxis: {
         title: {
             text: 'Horário'
         }
      }
    }
  end
  
  def get_box_graph(box_id)
    line_chart get_box_graph_path(id: box_id), height: '100%', library: {
      title: {text: 'Nível x Tempo', x: 0},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Nível'
         }
      },
      xAxis: {
         title: {
             text: 'Horário'
         }
      }
    }
  end
end
