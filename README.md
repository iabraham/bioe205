# BIOE 205 Course Website

This is the repository for the Spring 2023 offering of BIOE 205 at the
University of Illinois Urbana-Champaign. This
repository is structured as a [Franklin](https://github.com/tlienart/Franklin.jl)
website/project. Please take a look at an explanation of the [folder
structure](https://franklinjl.org/workflow/#folder_structure). 

## Usage 

To use this repository; [git
clone](https://www.w3docs.com/learn-git/git-clone.html) it to your local
device. Then from the repository (`cd` into it) run

`julia --project=.`

to start a [Julia REPL](https://docs.julialang.org/en/v1/stdlib/REPL/) within
the repository. Of course this assumes you have a functioning installation of
[Julia](https://julialang.org/downloads/) that can be called from the 
[command line/terminal.](https://julialang.org/downloads/platform/).

In the Julia prompt running:

```> using Franklin
   > serve()
```

will open a webpage with a live development preview of the course website. For
information on how to [edit](https://franklinjl.org/syntax/markdown/) and 
[publish](https://franklinjl.org/workflow/deploy/) the website see the 
[linked documentation](https://franklinjl.org/).

## Spring 2023

For Spring 2023 the website is hosted over at [Grainger Course
Websites](https://courses.grainger.illinois.edu/). Other web hosting options
are available as listed
[here](https://engrit.illinois.edu/services/website-hosting-design/course-website-hosting)
but our choice permits greatest flexibility and compatibility with the
Franklin workflow. 

To get started, see [this resource](https://answers.uillinois.edu/illinois.engineering/page.php?id=80882). For
hosting on the `courses.grainger.illinois.edu` website; the typical usage is to
copy contents of the
[`__site/`](https://franklinjl.org/workflow/deploy/#deploying_on_an_existing_web_server)
folder obtained after running `optimize` from the REPL using your favourite
`sftp` tool (e.g. FileZilla, CyberDuck etc.) to the particular term/semester:

```sftp.courses.grainger.illinois.edu/courses/bioe205/<term>```


## TODO Items

 - Add search functionality with [lunr](https://franklinjl.org/extras/lunr/)
 - Set up [Literate](https://github.com/fredrikekre/Literate.jl) as discussed
   [here](https://franklinjl.org/extras/literate/) so we can eventually turn
   this to well-indexed website (e.g. like
   [this](https://juliaai.github.io/DataScienceTutorials.jl/) example).
