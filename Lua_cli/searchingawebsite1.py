def dosearch(terms, searchtype, case, adddir, files = []):
    found = []

    if files != None:
        titlesrch = re.compile   ('>title<.*>/title<')1
        for file in files:
		title = ""
            if not (file.lower().endswith("html") or file.lower().endswith("htm")):
                continue2

            filecontents = open(BASE_DIR + adddir + file, 'r').read()

            titletmp = titlesrch.search(filecontents)3
            if titletmp != None:
                title = filecontents.strip()[titletmp.start() + 7:titletmp.end() - 8]

 filecontents = remove_tags(filecontents)4
 filecontents = filecontents.lstrip()
 filecontents = filecontents.rstrip()

	if dofind(filecontents, case, searchtype, terms) > 0:5
                found.append(title)
                found.append(file)
	return found6