#import "@preview/slydst:0.1.4": *
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: slides.with(
  title: "Simulação de Transmissor e Receptor PTT-A3 para Aplicações no Sistema de Satélites ARGOS-3",
  subtitle: "Trabalho de Conclusão de Curso - 2",
  date: "06 de Novembro de 2025",
  authors: ("Arthur Cadore M. Barcella"),
  layout: "medium",
  ratio: 16/9,
  title-color: none,
)

== Sumário

#outline()

= Objetivos

== Objetivo Geral

Desenvolver um simulador de transmissão e recepção de sinais seguindo o padrão PTT-A3 (Platform Transmitter Terminal) para aplicações no sistema de satélites ARGOS-3, com o intuito de auxiliar na análise e validação do desempenho do sistema.

- Estudar o padrão de comunicação ARGOS; 
- Simular a cadeia de transmissão do sistema PTT-A3;
- Simular o efeito da adição de ruído;
- Simular a detecção de portadoras; 
- Simular a cadeia de recepção do sistema ARGOS-3; 
- Simular a montagem e intepretação do datagrama recebido;
- Analisar o desempenho do sistema comparando com outros métodos de transmissão de dados;

= Fundamentação Teórica

== PCD (Plataforma de Coleta de Dados)

As PCDs são responsáveis pela coleta de dados ambientais em diversas regiões do Brasil, utilizando sensores para monitorar variáveis como temperatura, umidade, pressão atmosférica, entre outros.

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #figure(
            figure(
              image("./assets/PCD1.png", width: 47.5%),
              numbering: none,
              caption: figure.caption([PCD Terrestre], position: top)
            ),
          )
        ],
        [
          #figure(
            figure(
              image("./assets/PCD2.png", width: 45%),
              numbering: none,
              caption: figure.caption([PCD Marítima (Projeto Pirata)], position: top)
            ),
          )
        ],
    ),
)

== PCDs no Brasil

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
        #align(left)[

        Exemplo de dados coletados da PCD 31855:

        - Direção do vento; 
        - Precipitação;
        - Pressão atmosférica;
        - Radiação solar acumulada;
        - Temperatura do ar;
        - Umidade relativa do ar;
        - Velocidade do vento;

        Dados coletados através do SINDA (Sistema Integrado de Dados Ambientais)

        ]
        ],
        [
          #figure(
          figure(
            image("./assets/geoplot.svg", width: 95%),
            numbering: none,
            caption: figure.caption([PCDs espalhadas pelo brasil], position: top)
          ),
)
        ],
    ),
)

== Satélites

Os dados coletados pelos sensores são enviados para os satélites em orbita, como CBERS-4 e SCD-1, que são responsáveis por receber os sinais das PCDs e retransmiti-los para as Estações Terrenas de Recepção (ETRs).

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #figure(
            figure(
              image("../assets/cap2/sat-CBERS-4.png", width: 60%),
              numbering: none,
              caption: figure.caption([Satélite CBERS-4], position: top)
            ),
          )
        ],
        [
          #figure(
            figure(
              image("../assets/cap2/sat-SCD-1.png", width: 60%),
              numbering: none,
              caption: figure.caption([Satélite SCD-1], position: top)
            ),
          )
        ],
    ),
)

== ETR (Estação Terrestre de Recepção)

As ETRs são responsáveis por receber os sinais retransmitidos pelos satélites, processá-los e armazená-los para posterior análise e utilização dos dados coletados. 

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #figure(
            figure(
              image("./assets/passada.png", width: 100%),
              numbering: none,
              caption: figure.caption([Passada dos satélites], position: top)
            ),
          )
        ],
        [
          #figure(
            figure(
              image("./assets/ETR.png", width: 100%),
              numbering: none,
              caption: figure.caption([ETR (Estação Terrestre de Recepção)], position: top)
            ),
          )
        ],
    ),
)

// == Retransmissão PCD -> Satélite -> ETR

// #align(horizon+center)[
// #figure(
//   figure(
//     image("./assets/retransmissao.svg", width: 100%),
//     numbering: none,
//     caption: figure.caption([], position: top)
//   ),
// )
// ]

== Payload de Aplicação

O payload de aplicação do ARGOS-3 é composto por diversos campos que armazenam informações essenciais para a correta interpretação dos dados transmitidos pelas PCDs.

#align(horizon+center)[
#figure(
  figure(
    image("./assets/payload.svg", width: 80%),
    numbering: none,
    caption: figure.caption([], position: top)
  ),
)
]

== Identificação da PCD

O campo de identificação da PCD é crucial para garantir que os dados recebidos possam ser associados corretamente à fonte de coleta.

#align(horizon+center)[
#figure(
  figure(
    image("./assets/pcdid.svg", width: 75%),
    numbering: none,
    caption: figure.caption([], position: top)
  ),
)
]

== Comprimento de mensagem

O campo de comprimento da mensagem é responsável por indicar o tamanho total dos dados transmitidos, permitindo que o receptor saiba exatamente quantos bytes esperar.

#align(horizon+center)[
#figure(
  figure(
    image("./assets/messagelength.svg", width: 75%),
    numbering: none,
    caption: figure.caption([], position: top)
  ),
)
]

== Datagrama ARGOS-3

O padrão ARGOS-3 possui um formato específico de datagrama para a transmissão dos dados coletados pelas PCDs, conforme apresentado a seguir.

#align(horizon+center)[
#figure(
  figure(
    image("./assets/datagram.svg", width: 100%),
    numbering: none,
    caption: figure.caption([], position: top)
  ),
)
]

== Quadro Transmitido

O quadro transmitido no padrão ARGOS-3, inclui três campos, sendo eles: portadora pura, preâmbulo e datagrama, conforme apresentado a seguir.

#align(horizon+center)[
#figure(
  figure(
    image("./assets/quadro.svg", width: 80%),
    numbering: none,
    caption: figure.caption([], position: top)
  ),
)
]

= Desenvolvimento

== Transmissor ARGOS-3

#align(horizon+center)[
#figure(
  figure(
    image("./assets/transmissor.svg", width: 100%),
    numbering: none,
    caption: figure.caption([Diagrama de blocos do Transmissor], position: top)
  ),
)
]


== Datagrama 

#align(horizon+center)[
#figure(
  figure(
    image("./assets/transmitter_datagram_time.svg", width: 100%),
    numbering: none,
    caption: figure.caption([Sequência $u[n]$ do datagrama], position: top)
  ),
)
]

== Codificador convolucional

#align(horizon+center)[
#figure(
  figure(
    image("./assets/conv_coding.svg", width: 90%),
    numbering: none,
    caption: figure.caption([Diagrama de blocos - Codificador convolucional], position: top)
  ),
)
]

== Embaralhador

#align(horizon+center)[
#figure(
  figure(
    image("./assets/scrambler.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Diagrama de blocos - Embaralhador], position: top)
  ),
)
]

== Multiplexador

#align(horizon+center)[ 
#figure(
  figure(
    image("./assets/transmitter_mux_time.svg", width: 100%),
    numbering: none,
    caption: figure.caption([Multiplexação - preâmbulo com sequência embaralhada], position: top)
  ),
)
]


== Modulação de pulso (domínio do tempo)

#align(horizon+center)[
#figure(
  figure(
    image("./assets/transmitter_formatter_time.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Formatação dos simbolos para transmissão], position: top)
  ),
)
]


== Modulação de pulso (domínio da frequência)

#align(horizon+center)[
#figure(
  figure(
    image("./assets/transmitter_formatter_freq.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Formatação dos simbolos para transmissão], position: top)
  ),
)
]

== Modulador QPSK

#align(horizon+center)[
#figure(
  figure(
    image("./assets/modulador.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Diagrama de blocos do modulador QPSK], position: top)
  ),
)
]

== Modulação em banda passante


#align(horizon+center)[
#figure(
  figure(
    image("./assets/transmitter_modulator_time.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Modulação do sinal em banda passante], position: top)
  ),
)
]

== Modulação em banda passante (período de portadora pura)


#align(horizon+center)[
#figure(
  figure(
    image("./assets/transmitter_modulator_portadora.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Período de portadora pura - comparação do domínio da frequência], position: top)
  ),
)
]

== Receptor ARGOS-3

#align(horizon+center)[
#figure(
  figure(
    image("./assets/receptor1.svg", width: 100%),
    numbering: none,
    caption: figure.caption([Diagrama de blocos do receptor], position: top)
  ),
)
] 

== Detecção de portadora

#align(horizon+center)[
#figure(
  figure(
    image("./assets/detector.svg", width: 100%),
    numbering: none,
    caption: figure.caption([Diagrama de blocos - Detector de portadora], position: top)
  ),
)
]

== Detecção de portadora

#align(horizon+center)[
#figure(
  figure(
    image("./assets/example_detector_freq.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Detecção de portadora - domínio da frequência], position: top)
  ),
)
]

== Diagrama de Waterfall do sinal recebido

#align(horizon+center)[
#figure(
  figure(
    image("./assets/example_detector_waterfall.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Diagrama de Waterfall - tempo vs frequência], position: top)
  ),
)
]

== Diagrama de Waterfall detecção

#align(horizon+center)[
#figure(
  figure(
    image("./assets/example_detector_waterfall_detection.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Diagrama de Waterfall - detecção], position: top)
  ),
)
]


== Diagrama de Waterfall decisão

#align(horizon+center)[
#figure(
  figure(
    image("./assets/example_detector_waterfall_decision.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Diagrama de waterfall - decisão], position: top)
  ),
)
]

== Demodulação para banda base 

#align(horizon+center)[
#figure(
  figure(
    image("./assets/receiver_demodulator_freq.svg", width: 90%),
    numbering: none,
    caption: figure.caption([Demodulação do segmento de sinal para banda base], position: top)
  ),
)
]

== Filtro passa baixa

#align(horizon+center)[
#figure(
  figure(
    image("./assets/receiver_lpf_freq.svg", width: 90%),
    numbering: none,
    caption: figure.caption([Filtragem passa baixa - domínio da frequência], position: top)
  ),
)
]

== Filtro casado

#align(horizon+center)[
#figure(
  figure(
    image("./assets/receiver_mf_freq.svg", width: 90%),
    numbering: none,
    caption: figure.caption([Filtragem casada - domínio da frequência], position: top)
  ),
)
]

== Processo de sincronização

#align(horizon+center)[
#figure(
  figure(
    image("./assets/sync.svg", width: 100%),
    numbering: none,
    caption: figure.caption([Diagrama de blocos - sincronizador], position: top)
  ),
)
]

== Vetor de sincronismo (vetor esperado)

#align(horizon+center)[
#figure(
  figure(
    image("./assets/example_synchronizer_word.svg", width: 90%),
    numbering: none,
    caption: figure.caption([Vetor de sincronismo (vetor esperado)], position: top)
  ),
)
]

== Vetor de correlação esperado vs recebido

#align(horizon+center)[
#figure(
  figure(
    image("./assets/receiver_sync_corr.svg", width: 100%),
    numbering: none,
    caption: figure.caption([Correlação sinal esperado vs recebido], position: top)
  ),
)
]

== Sincronização por correlação

#align(horizon+center)[
#figure(
  figure(
    image("./assets/receiver_sync_time.svg", width: 90%),
    numbering: none,
    caption: figure.caption([Momento de sincronização $tau$ no sinal recebido], position: top)
  ),
)
]

== Amostragem do sinal recebido (domínio do tempo)

#align(horizon+center)[
#figure(
  figure(
    image("./assets/receiver_sampler_time.svg", width: 90%),
    numbering: none,
    caption: figure.caption([Amostragem do sinal recebido - domínio do tempo], position: top)
  ),
)
]

== Amostragem do sinal recebido (plano IQ)

#align(horizon+center)[
#figure(
  figure(
    image("./assets/receiver_sampler_const.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Amostragem do sinal recebido - plano IQ], position: top)
  ),
)
]


== Montagem datagrama

#align(horizon+center)[
#figure(
  figure(
    image("./assets/receptor2.svg", width: 100%),
    numbering: none,
    caption: figure.caption([Diagrama de blocos receptor - após amostragem], position: top)
  ),
)
]

= Resultados 

== BER Vs SNR

#align(horizon+center)[
#figure(
  figure(
    image("./assets/ber_vs_ebn0.svg", width: 80%),
    numbering: none,
    caption: figure.caption([Taxa de Erro de Bit (BER) vs. Relação Sinal-Ruído (SNR)], position: top)
  ),
)
]

== Biblioteca Python ARGOS-3

#align(horizon+center)[
#sourcecode(```python
>>> import argos3 as a3
>>> dx = a3.Datagram(pcdnum=1234, numblocks=1)
>>> print(dx.parse_datagram())
{
  "msglength": 1,
  "pcdid": 1234,
  "data": {
    "bloco_1": {
      "sensor_1": 37,
      "sensor_2": 198,
      "sensor_3": 9
    }
  },
  "tail": 7
}
```)

]


= Referências: 

== Referências

- BRAZILIAN SPACE-BASED ENVIRONMENTAL DATA COLLECTION SYSTEM. INPE, 2015. Disponível em: http://mtc-m16c.sid.inpe.br/col/sid.inpe.br/ePrint@1905/2006/08.03.20.37/doc/wilson_yamaguti.pdf. Acesso em: 10 out. 2025.

- ACESSO AO SISTEMA INTEGRADO DE DADOS AMBIENTAIS - SINDA. INPE, 2024. Disponível em: http://sinda.crn.inpe.br/PCD/. Acesso em: 10 out. 2025.