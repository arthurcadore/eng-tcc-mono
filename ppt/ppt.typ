#import "@preview/typslides:1.3.0": *
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: typslides.with(
  ratio: "16-9",
  theme: "bluey",
  font: "Fira Sans",
  font-size: 20pt,
  link-style: "color",
  show-progress: true,
)

#front-slide(
  title: "Simulação de Modulador/Demodulador PTT-A3 para Aplicações no Sistema de Satélites ARGOS-3",
  subtitle: [Trabalho de Conclusão de Curso - 2],
  authors: "Arthur Cadore M. Barcella",
  info: [#link("https://arthurcadore.github.io/argos3")],
)

// Custom outline
#table-of-contents()



== Sumário

#outline()

= Objetivos

== Objetivo Geral

Desenvolver um simulador de modulador/demodulador PTT-A3 (Platform Transmitter Terminal) para aplicações no sistema de satélites ARGOS-3, com o intuito de auxiliar na análise e validação do desempenho do sistema.

- Estudar o padrão de comunicação ARGOS; 
- Simular a detecção de portadoras; 
- Simular a modulação e demodulação dos sinais enviados por uma PCD (Ponto de Coleta de Dados); 
- Simular o efeito da adição de ruído;
- Simular a montagem e intepretação do datagrama das PCDs.

= Fundamentação Teórica

== PCDs no Brasil

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
        #align(left)[

        Coleta de dados ambientais, como por exemplo os dados coletados da PCD 31855

        - Direção do vento; 
        - Precipitação;
        - Pressão atmosférica;
        - Radiação solar acumulada;
        - Temperatura do ar;
        - Umidade relativa do ar;
        - Velocidade do vento;

        Dados coletados através do SINDA (Sistema Integrado de Dados Ambientais, Fonte: http://sinda.crn.inpe.br/PCD/)

        ]
        ],
        [
          #figure(
          figure(
            rect(image("./assets/geoplot.svg", width: 100%)),
            numbering: none,
            caption: figure.caption([PCDs espalhadas pelo brasil], position: top)
          ),
)
        ],
    ),
)


== Satélites para retransmissão

Os dados coletados pelos sensores são enviados para os satélites em orbita, como CBERS-4 e SCD-1, que são responsáveis por receber os sinais das PCDs e retransmiti-los para as Estações Terrenas de Recepção (ETRs).

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #figure(
            figure(
              rect(image("../assets/cap2/sat-CBERS-4.png", width: 50%)),
              numbering: none,
              caption: figure.caption([Satélite CBERS-4], position: top)
            ),
          )
        ],
        [
          #figure(
            figure(
              rect(image("../assets/cap2/sat-SCD-1.png", width: 50%)),
              numbering: none,
              caption: figure.caption([Satélite SCD-1], position: top)
            ),
          )
        ],
    ),
)



== Transmissor

#align(horizon+center)[
#figure(
  figure(
    rect(image("./assets/blocos_modulador.svg", width: 100%)),
    numbering: none,
    caption: figure.caption([Diagrama de blocos do Transmissor], position: top)
  ),
)
]

== Receptor

#align(horizon+center)[
#figure(
  figure(
    rect(image("./assets/blocos_demodulador.svg", width: 100%)),
    numbering: none,
    caption: figure.caption([Diagrama de blocos do Receptor], position: top)
  ),
)
] 