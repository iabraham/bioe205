+++
title = "Lecture Notes"
hascode = true
hastex = true
+++


# Group project details

## Objective
The purpose of this project is for each team of students to learn more about 
modeling and simulation of signals and systems using software tools,
particularly MATLAB and Simulink. These projects will provide everyone with an
opportunity to apply techniques learned in class to real physiological data.

## Datasets
Each team should examine and study a specific physiological data set from
those listed below and available via PhysioNet. The below list has been curated
for size (not too small, not too big) and ability to visualize the waveforms
without downloading them (look for a link "Visualize Waveform" on the page for
each dataset) but not much else. 


## Questions
In your project you should try to answer the following:

- Review the background material about the instrument that obtained the data.
  * How was the data collected? What instrument was used? Are there limitations
    to the data? Has any signal processing been performed?
  * What is the most important information in the signal? What characteristics does
    this information have (frequency range, magnitude, etc.)?
- Plot the data in both the time and frequency domains.
  * What insights can you gain from these plots about the data?
- Design and apply one filter using simulation techniques in MATLAB.
  * After filtering, plot the output in the time and frequency domains and
    compare it to the plots from raw data. How well did the filter work?
- Design and apply a second filter using simulation techniques in MATLAB and/or Simulink.
  * After filtering, plot the output in the time and frequency domains and
    compare it to the plots from raw data. How well did the filter work?
- Compare the two filters.
  * Which one presents important information better? How do you know?
- Compare the filters on at least 5 trials/participants/runs.
  * Within the dataset select, four additional trials or subjects where at least
    one variable of the experiment changed. How do the outputs compare?

## Deliverables

There are three main deliverables. These are a project proposal, the final
poster/video and your code along with its documentation. 


### Project proposal

The first is a project proposal due before Spring Break (i.e. March 10, 5.00
pm). This is a one page PDF document listing the group members (more than one,
less than four), the chosen dataset along with a short summary of it & why it is
interesting to the group and the intended type of final deliverable
(poster/video). In this document, mention how often the team plans to meet,
what software the team intends to use and the mutual expectations and
responsibilities between team members. This will serve as a contract amongst
the team. 


### Summary Poster/Video
Each team will create a poster or video presentation summarizing the background
information about the dataset, the rationale behind the analysis approach as
well as key takeaways including results of the modeling and simulation. 
The results should include a description of each filter and why it was chosen
and the comparison of the results. This will be the primary final deliverable. 

The poster should be no larger than 36 inches by 48 inches and in a vector PDF
format. It can be a traditional [research
poster](https://undergradresearch.illinois.edu/guidelines.html) or infographic
as long as it covers the above information. The video summary should be 8-10
minutes in length (hard upper limit). The video can be created via a service
such as [Powtoon](https://www.powtoon.com/), recorded with slides on a screen
in a conference room, or with slides via Zoom. 

### Supplemental report
In addition to the summary presentation, each team will submit a supplemental
text document that includes references used in the presentation and a list of
the contributions of each team member to the project. The references should
include all sources used from journals, the internet, discussions, etc. The
references should be documented using the IEEE citation format. See [this
gude](https://owl.purdue.edu/owl/research_and_citation/ieee_style/ieee_overview.html)
or our library [reference](https://guides.library.illinois.edu/citingsources)
and the [official
documentation](https://ieeeauthorcenter.ieee.org/wp-content/uploads/IEEE-Reference-Guide.pdf)

All MATLAB and Simulink files should be well documented using text (in Live
Scripts or Simulink annotations) and comments. Another group in the course
should be able to open your LiveScript and understand what you did after
reading the document. The dataset used should be documented within the files.
If someone (e.g., a grader, TA or Instructor) has the dataset and the team’s
MATLAB/Simulink files, they should be able to run the files and recreate the
plots. Therefore, all data loading, processing, and simulation should be
contained in one of the files that are submitted.


### Deadlines

- March 10: Project proposal due by 5.00 pm
- May 10: Final deliverable due by 5.00 pm


### Suggested Datasets

Note: Projects in bold have been used in previous semesters. 

{{textableinput project/datasets.csv}}
