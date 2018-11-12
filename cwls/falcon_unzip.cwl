#!/usr/bin/env cwl-runner

class: CommandLineTool

id: "falcon unzip"

label: "FALCON (Pacific Biosciences) pd-assembly (unzip) flow"

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

hints:
  - class: ResourceRequirement
    coresMin: 10
    ramMin: 393216

inputs:
  config:
    type: File
    doc: "fc_unzip.py config file"

baseCommand: ["fc_unzip.py"]

$schemas:
  - http://schema.org/docs/schema_org_rdfa.html

$namespaces:
  s: http://schema.org/

s:codeRepository: https://github.com/cancerit/dockstore-FALCON
s:license: https://spdx.org/licenses/AGPL-3.0-only

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-0407-0386
    s:email: mailto:cgphelp@sanger.ac.uk
    s:name: David Jones
