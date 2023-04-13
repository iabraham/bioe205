+++
title = "Lecture Notes"
+++


# Lecture notes

This page links to lectures notes that will be posted once per week and are
supposed to supplement the textbook and lecture slides used in class. 

Each of these notes will correspond roughly to two (maximum three) in-class
lectures. 

```julia:leccards
#hideall
lectures = [
  (num="Lecture 01", pic="lec01", title="Introduction", topic="Introductory material on signals & systems", link="lec01"),
  (num="Lecture 02", pic="lec02", title="System topics", topic="Noise, variability, types of signals & systems", link="lec02"),
  (num="Lecture 03", pic="lec03", title="Basic waveforms", topic="Modeling & simple operations on signals", link="lec03"), 
  (num="Lecture 04", pic="lec04", title="Statistics", topic="Basics of signal statistics", link="lec04"),
  (num="Lecture 05", pic="lec05", title="Correlations", topic="Orthogonality & averaging", link="lec05"),
  (num="Lecture 06", pic="lec06", title="Vector spaces", topic="Intuition regarding change of basis", link="lec06"),
  (num="Lecture 07", pic="lec07", title="Fourier transform I", topic="Introduction to Fourier Transform", link="lec07"),
  (num="Lecture 08", pic="lec08", title="Fourier transform II", topic="Other forms of Fourier Transform", link="lec08"),
  (num="Lecture 09", pic="lec09", title="DFT/Sampling", topic="Sampling theorem & consequences on DFT", link="lec09"),
  (num="Lecture 10", pic="lec10", title="Impulse response", topic="Introduction to linear systems analysis", link="lec10"),
  (num="Lecture 11", pic="lec11", title="System response", topic="Frequency response & transfer functions", link="lec11"),
  (num="Lecture 12", pic="lec12", title="Bode plots", topic="Bode plot examples & MATLAB", link="lec12"),
  (num="Lecture 13", pic="lec13", title="Laplace transform", topic="Laplace transforms, ODEs and IVPs", link="lec13"), 
  (num="Lecture 14", pic="lec14", title="Second order systems & Simulink", topic="Second order systems, Simulink", link="lec14") 
  ]

"@@cards @@row" |> println
for lecture in lectures
  """
  @@column
    \\card{$(lecture.num)}{$(lecture.pic)}{$(lecture.title)}{$(lecture.topic)}{$(lecture.link)}
  @@
  """ |> println
end
println("@@ @@") # end of cards + row
```

\textoutput{leccards}


\note{These notes are by no means perfect; they are being written up for the
first time and a work-in-progress. There might be a plethora of typos or
unintentional mistakes peppered through them. Please point them out or bring
them up.}

\caution{These notes are intentionally **not** mathematically rigorous due to
various reasons (breadth of topics to cover, curriculum plan, etc.). The
more mathematically inclined student can find far more meticulous & precise 
treatment of the subject matter elsewhere.}

