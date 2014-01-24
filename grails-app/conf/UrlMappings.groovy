class UrlMappings {

	static mappings = {

        "/rest/v1/patients"(resources:"patient", namespace:"v1")

        "/patient/$action?/$id?"(controller:"patient", namespace:"default")

        "/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
