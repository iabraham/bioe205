# Parent file to run all scripts which may generate
# some output that you want to display on the website.
# this can be used as a tester to check that all the code
# on your website runs properly.

dir = @__DIR__

function genplain(s::String)
    open(joinpath(dir, "output", "$(splitext(s)[1]).txt"), "w") do outf
        redirect_stdout(outf) do
            include(joinpath(dir, s))
        end
    end
end

isjulia = endswith(".jl")
jlfiles_in(x) = [z for z in readdir(x) if isjulia(z)]
lectures = [1, 2, 3, 4, 5, 6, 7, 8, 9]
folders =  ["lec" * lpad(x, 2, "0") for x in lectures]


file_list = Dict(f => jlfiles_in(joinpath(dir, f, "code")) for f in folders)
for (lec, files) in file_list
	foreach(files) do file
		include(joinpath(lec, "code", file))
	end
end
