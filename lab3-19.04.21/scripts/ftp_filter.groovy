if (args.size() > 2) throw Exception("You should set search pattern as an argument")
args[0].toList().with { pattern ->
    def sites = new File("ftp_db.txt").readLines()
        .collect {
            def links = it.trim().replaceAll("\\s+", " ").split(" ")
            [links[1], links[3], links[5]]
        }
        .flatten()
        .findAll { it.toList().containsAll(pattern) }
    sites.each {  println it }
    println "Total = ${sites.size()}"
}