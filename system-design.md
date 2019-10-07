# ADA v1.0 System Design

Interoperable authoring and publishing system. The medium-long list.

1. Connector - ADA: connects to different apps, **GUI for user and admins**.
  - Authentication?: GCP, OAuth, Okta https://developer.okta.com/, or one Mosheda is building @mosheda
  - Data connections: Apache Kafka (need to understand better how this replaces APIs)
  - Data connections: direct
  - messaging
  - **workflow recipes** BPM https://wexflow.github.io/ ?
1. Storage?
1. Writing interface - Fidus Writer
  - MySQL storage
  - Bring in Gutenberg use, web components
1. Metadata store, creation?
1. DOI generation
1. Images?
1. Diagrams: Draw.io
1. Validator pipeline and more e.g., **Interactive GUI: corrections and request any format**? Transpect
1. Publication outputs: Transpect pipeline to feed all of the below, with some going through Fidus Writers outputs, but still need validating and delivering to a output storage point
  - XHTML/HTML to Viviostyle and deposit in a Container to serve to web, or onto GitHUB/Lab to serve, maybe with options from either via Hugo, Jekyll, or just GH Pages.
  - To Hugo HTML webbook, onto GitHub/Lab to GH pages, or/and to straight serving
  - eBook generation
   - deliver eBook to distributor
  - Screen PDF and Print PoD PDF generation
   - deliver PDF and data to PoD printer
  - PoD cover generation
  - JATS
  - XML, HTML outputs
  - Juypter Book (markdown?)
  - Output all of above format types as downloads from outputs such as (Vivlio, HTML webbooks, Jupyter Book), including: PDF, PoD purchase, JATS, eBooks, etc
  - Previewing for outputs
  - Centralising styling, al la Bootstrap like
  - Packaging
