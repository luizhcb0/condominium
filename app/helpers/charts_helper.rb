module ChartsHelper
  
  def get_all_boxes_graph
    line_chart get_all_boxes_graph_path, height: '100%', library: {
      title: {text: 'Níveis x Tempo', x: 0},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Nível'
         },
         tickInterval: 1,
         min: 0,
         max: 3
      },
      xAxis: {
        title: {
            text: 'Horário'
        },
        type: 'datetime',
        # dateTimeLabelFormats: {
        #     second: '%Y-%m-%d<br/>%H:%M:%S',
        #     minute: '%Y-%m-%d<br/>%H:%M',
        #     hour: '%Y-%m-%d<br/>%H:%M',
        #     day: '%Y-%m-%d',
        #     week: '%Y<br/>%m-%d',
        #     month: '%Y-%m',
        #     year: '%Y'
        # },
        # range: 6 * 30 * 24 * 3600 * 1000,
        # tickInterval: 24 * 3600 * 1000,
        range:  1 * 3600 * 1000,
        startOnTick: true,
        endOnTick: true,
        # max: 10
        # min: 1491571200000,

         
      },
      # rangeSelector: {
      #   allButtonsEnabled: false,
      #   enabled: true
      # },
      credits: {
          enabled: true,
          position: {
            align: 'right',
            x: -10,
            verticalAlign: 'bottom',
            y: -5
          },
          href: "http://www.google.com",
          text: "LCA®"
      },
      scrollbar: {
          enabled: true
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
