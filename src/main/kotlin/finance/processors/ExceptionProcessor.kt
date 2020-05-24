package finance.processors

import org.apache.camel.Exchange
import org.apache.camel.Processor
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Component
import kotlin.system.exitProcess

@Component
open class ExceptionProcessor  @Autowired constructor() : Processor {
    override fun process(exchange: Exchange) {
        //TODO("Not yet implemented")
        val message = exchange.`in`
        val payload  = message.getBody(Exception::class.java)
        println(payload)
        //exitProcess(1)
    }

}