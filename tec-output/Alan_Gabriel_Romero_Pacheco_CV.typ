
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Alan Gabriel Romero Pacheco"
#let locale-catalog-page-numbering-style = context { "Alan Gabriel Romero Pacheco - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Mar 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Raleway"
#let design-section-titles-bold = false
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Raleway"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Raleway"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "Raleway"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = left
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = false
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Alan Gabriel Romero Pacheco

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Guadalajara,MX],
  [#box(original-link("mailto:alanromero@tec.mx")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)alanromero\@tec.mx])],
  [#box(original-link("tel:+52-55-8368-7858")[#fa-icon("phone", size: 0.9em) #h(0.05cm)55 8368 7858])],
  [#box(original-link("https://linkedin.com/in/alandgabriel")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)alandgabriel])],
  [#box(original-link("https://github.com/alandgabriel")[#fa-icon("github", size: 0.9em) #h(0.05cm)alandgabriel])],
)
#connections(connections-list)



== Personal Profile


#one-col-entry(
  content: [Data Scientist specializing in signal and image processing, machine learning, and computer vision, with a focus on urban planning, and multimodal sensor systems. My expertise spans applications in smart cities, healthcare, and IoT, where I develop AI-driven solutions to extract insights from complex data for decision-making in urban planning and healthcare. I am passionate about innovation and technology transfer, and I have experience building scalable platforms and collaborating with research institutions to advance sustainability and urban mobility.]
)


== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[MSc]],
  middle-content: [
    #strong[UNAM], Computer Science and Engineering -- Mexico City
  ],
  right-content: [
    Aug 2020 – Dec 2022
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([Speckle tracking algorithm using deep learning],)
  ],
  inset: (
    left: design-entry-types-education-entry-degree-column-width + design-entries-horizontal-space-between-columns + design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BSc]],
  middle-content: [
    #strong[UAM], Biomedical Engineering -- Mexico City
  ],
  right-content: [
    Aug 2015 – Nov 2019
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([Association between the dynamics of heartbeat time series and breath time series in subjects with aortic valve disease],)
  ],
  inset: (
    left: design-entry-types-education-entry-degree-column-width + design-entries-horizontal-space-between-columns + design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[Tn]],
  middle-content: [
    #strong[CETI], Electronics and Communications -- Guadalajara, Mexico
  ],
  right-content: [
    Aug 2011 – June 2015
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([My project won a science fair as the capstone project for all technological degree programs. It involved the development of a portable device for monitoring vital signs, with smartphone connectivity.],)
  ],
  inset: (
    left: design-entry-types-education-entry-degree-column-width + design-entries-horizontal-space-between-columns + design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Research Specialist], Tecnológico de Monterrey -- Guadalajara, Mexico
  ],
  right-content: [
    Feb 2023 – present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Lead the development of AI-driven systems that integrate edge computing, cloud computing, and computer vision models with web platforms to generate advanced analytics on urban spaces and traffic dynamics.],[Responsible for the automated construction and refinement of transportation networks using Python and VISUM for agent-based traffic microsimulation.],[Professor of Sofware Engineering and Medical Image Processing courses],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Tutor], Coderhouse -- Buenos Aires
  ],
  right-content: [
    May 2022 – Aug 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Tutorials in the area of Data Science, Data Analytics and Python.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Data Engineer], Grupo TI -- Mexico City
  ],
  right-content: [
    Feb 2022 – Jan 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Develop ETL solutions for distributed system clusters, optimizing data pipelines for enterprise data warehouses.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Teacher’s Assistant], UNAM -- Mexico City
  ],
  right-content: [
    Feb 2022 – Dec 2022
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Teach the practical part of the course of Quantum Computing and the course of Neural Networks],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Software Engineer], Omedic -- Mexico City
  ],
  right-content: [
    May 2020 – Jan 2021
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Automate the sending of clinical laboratory results],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Service Engineer], Viter Medical -- Mexico City
  ],
  right-content: [
    Dec 2019 – May 2020
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Install, train medical personnel, distribute, and maintain medical equipment in IMSS hospitals in the southeast region of Mexico.],)
  ],
)



== Projects


#two-col-entry(
  left-content: [
    #strong[VisionCity] 
  ],
  right-content: [
    Feb 2023 – present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A subscription-based platform for urban monitoring])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([We have a subscription-based platform integrating computer vision for occupancy, trajectories, and activities, using existing surveillance cameras. The platform also incorporates custom environmental sensors, and we are developing a multimodal sensor \(radar + vision\) for analyzing urban space usage. With a TRL 4, our project aims to create healthy, sustainable, and successful urban spaces, with a growth projection as a startup, having already participated in incubators.],[Acceleration funding - Coramino Acceleration Funding from Jose Cuervo Foundation],[Credits funding - AI for Good Open Call from Microsoft],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Adaptation of the GTAModel V4 for the Monterrey Metropolitan Area] 
  ],
  right-content: [
    June 2023 – present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([This project is part of the Monterrey Metropolitan Area's traffic microsimulation project, where I am responsible for the automated construction and refinement of transportation networks using Python and VISUM.],[Collaboration with the Travel Modelling Group, University of Toronto],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Traffic Conflict Analysis] 
  ],
  right-content: [
    Apr 2024 – Aug 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Open web platform for traffic conflict analysis])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Free tool to identify traffic conflicts through the analysis of videos captured by cameras installed at road intersections],[The platform is made open-source, this is the #link("https://tca.mexico.itdp.org/")[web page] and this is the #link("https://github.com/ITDPmx/traffic-conflicts-analysis")[repository]],[Collaboration project funding from ITDP Mexico and FIA Foundation],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Speckle Tracking Algorithm using Deep Learning.] 
  ],
  right-content: [
    Feb 2021 – Feb 2022
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A novel algorithm for tracking speckle patterns in ultrasound images])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([This project introduces a deep learning method for global longitudinal strain estimation in 2D echocardiograms, achieving high accuracy and stability. It outperforms state-of-the-art methods.],[This algorithm is made open-source \(#link("https://github.com/ArBioIIMAS/echo-gma")[GitHub]\)],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Association between the dynamics of heartbeat time series and breath time series in subjects with aortic valve disease] 
  ],
  right-content: [
    Feb 2019 – Dec 2019
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([This project find a lineal association between the scale exponent of the intervals between breaths time series and the scale exponent of the intervals between beats time series in healthy subjects that get lossed in subjects with aortic valve diseace.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Remote-Controlled Vital Signs Monitor] 
  ],
  right-content: [
    Jan 2015 – June 2015
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Mobile-controlled device to monitor vital signs, displaying pressure, temperature, and heart rate using a microcontroller, Bluetooth, and sensors.],)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming:] C, C++, JAVA, Python, Scala, FORTRAN, VHDL, MATLAB, R, SQL, HTML, CSS, JavaScript, CUDA, OpenCL]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] English \(fluent\), Spanish \(native\)]
)


== Publications


#two-col-entry(
  left-content: [
    #strong[Deep Learning based Estimation of Left Ventricle Myocardial Strain from Echocardiograms with Occlusion Artifacts]

  ],
  right-content: [
    submitted
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Alan Romero-Pacheco, Nidiyare Hevia-Montiel, Blanca Vazquez, Fernando Arámbula Cosı́o, Jorge Perez-Gonzalez

#v(design-highlights-top-margin - design-text-leading)Journal of Medical Imaging])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Estimating Echocardiographic Myocardial Strain of Left Ventricle with Deep Learning]

  ],
  right-content: [
    Sept 2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Alan Romero-Pacheco, Jorge Perez-Gonzalez, Nidiyare Hevia-Montiel

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/EMBC48229.2022.9872008")[10.1109/EMBC48229.2022.9872008]])



== Congresses


#two-col-entry(
  left-content: [
    #strong[Smart Cities World Congress] -- #strong[Barcelona]
  ],
  right-content: [
    Nov 2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Urban Open Day, Tecnológico de Monterrey] -- #strong[Monterrey, Mexico]
  ],
  right-content: [
    Nov 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Presentation of “A Comprehensive Computer Vision Framework for Urban Analytics and Understanding Human Interactions in Public Space”],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[6th Winter School on Data Science and Complex Systems, IIMAS-UNAM] -- #strong[Mérida, Yucatán]
  ],
  right-content: [
    Jan 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Give a workshop of Neural Networks],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Annual International Conference of the IEEE Engineering in Medicine and Biology Society, EMBC] -- #strong[Glasgow]
  ],
  right-content: [
    July 2022
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([E-Poster presentation],)
  ],
)



== References



#one-col-entry(
  content: [
    #strong[Roberto Ponce Lopez] -- #strong[Leader]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [rpl\@tec.mx, +52 81 2202 7830])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Jose Antonio Torre Medina] -- #strong[Leader]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [jtorre\@tec.mx])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Miguel González Mendoza] -- #strong[Technical advisor]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [mgonza\@tec.mx, +52 55 5965 4479])], column-gutter: 0cm)
  ],
)



