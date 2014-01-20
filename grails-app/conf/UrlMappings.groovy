class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/patients/v1"(resources:"patient", namespace:'v1')

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
