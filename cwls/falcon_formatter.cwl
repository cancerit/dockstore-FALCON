#!/usr/bin/env cwl-runner

class: CommandLineTool

id: "FALCON-formatter"

label: "FALCON-formatter"

cwlVersion: v1.0

doc: |
  ![build_status](https://quay.io/repository/wtsicgp/dockstore-cgpwgs/status)
  A Docker container for the Pacific Biosciences FALCON (pb-assembly). 
  See the [dockstore-FALCON](https://github.com/cancerit/dockstore-FALCON)
  website for more information.

  Parameters for a CWL definition are generally described in a json file, but parameters can be provided on the command line.

  To see the parameters descriptions please run: cwltool --tool-help path_to.cwl

requirements:
  - class: DockerRequirement
    dockerPull: "quay.io/wtsicgp/casm-falcon:latest"

inputs:
  config:
    type: File
    doc: "fastq file to format"

baseCommand: ["FALCON-formatter"]

$schemas:
  - https://schema.org/version/latest/schema.rdf

$namespaces:
  s: http://schema.org/

s:codeRepository: https://github.com/cancerit/dockstore-FALCON
s:license: https://spdx.org/licenses/AGPL-3.0-only

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-0407-0386
    s:email: mailto:cgphelp@sanger.ac.uk
    s:name: David Jones
