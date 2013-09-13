package org.sacredheart

import org.springframework.validation.Errors
import org.springframework.validation.FieldError

class UtilTagLib {

	static namespace = "ui"
	
	def yesno = { attrs ->
		def bean = attrs.bean
		def property = attrs.property

		def btnclazz = (YesNo.Yes == bean[property]) ? 'btn-primary' : 'btn-inverse'
		out << "<button class=\"btn ${btnclazz}\" type=\"button\" disabled=\"\">"
		out << f.display('bean':bean, 'property':property)
		out << '</button>'
	}
}
