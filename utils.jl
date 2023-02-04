using DelimitedFiles

function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end


function hfun_textableinput(params)
  fpath = joinpath("_assets", params[1])
  content = readdlm(fpath, ',')

  io = IOBuffer()
  write(io, """
    <table>
    <thead>
      <tr>
    """)
  
  header = content[1, :]
  for col in header
    write(io, """
      <th>$col</th>
      """)
  end
  write(io, "</tr>")

  for rowidx in 2:size(content, 1)
    row = content[rowidx, :]
    write(io, "<tr>")
    for col in row
      write(io, "<td>$(fd2html(col; internal=true, nop=true))</td>")
    end
    write(io, "</tr>")
  end

  write(io, """
      </tbody>
    </table>
    """)
  return String(take!(io))
end
