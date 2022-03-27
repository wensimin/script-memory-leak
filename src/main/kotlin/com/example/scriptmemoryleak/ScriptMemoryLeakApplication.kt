package com.example.scriptmemoryleak

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.event.ContextRefreshedEvent
import org.springframework.context.event.EventListener
import javax.script.ScriptEngineManager

@SpringBootApplication
class ScriptMemoryLeakApplication {

    @EventListener(ContextRefreshedEvent::class)
    fun runScript() {
        for (i in 0..1000) {
            ScriptEngineManager().getEngineByExtension("kts").eval("val a=1")
            println(i)
        }
        while (true) {
            Thread.sleep(1000)
        }
    }
}

fun main(args: Array<String>) {
    runApplication<ScriptMemoryLeakApplication>(*args)
}
