package gticket

import enums.TipoChamado;

class Chamado {
	
	String titulo
	String descricao
	Date dateCreated
	Date lastUpdated
	TipoChamado tipo

    static constraints = {
		titulo nullable:false, maxSize:80
		descricao nullable:false, maxSize:400
		tipo nullable:false
		dateCreated nullable:true
		lastUpdated nullable:true
		
    }
}
