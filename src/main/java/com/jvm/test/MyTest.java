package com.jvm.test;

import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

public class MyTest {

    public static void main(String[] args) throws InterruptedException {
        final Mono<String> mono = Mono.just("hello ");

        Thread t = new Thread(() -> mono
                .subscribeOn(Schedulers.boundedElastic())
                .map(msg ->  {
                    System.out.println(msg + Thread.currentThread().getName());
                    return msg;
                })
                .block()
        );
        t.start();
        t.join();
    }
}
