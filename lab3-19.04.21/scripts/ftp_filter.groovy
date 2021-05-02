if (this.args.size() > 2) throw Exception("You should set filepath and pattern arguments")
this.args[1].toList().with { pattern ->
    def sites = new File(this.args[0]).readLines()
            .collect {
                def links = it.trim().replaceAll("\\s+", " ").split(" ")
                [links[1], links[3], links[5]]
            }
            .flatten()
            .findAll { it.toList().containsAll(pattern) }
    sites.each {  println it }
    println "Total = ${sites.size()}"
}