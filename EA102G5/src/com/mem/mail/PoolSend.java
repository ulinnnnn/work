package com.mem.mail;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class PoolSend {
	BlockingQueue<Runnable> workQueue;//任務佇列
	ExecutorService es;//執行緒池的介面

	public PoolSend() {
		workQueue = new LinkedBlockingQueue<>();//構造無界的任務佇列,資源足夠,理論可以支援無線個任務
		es = new ThreadPoolExecutor(2, 4, //2 core; 4 max
				30,TimeUnit.SECONDS, workQueue, //30s keep alive
				new ThreadPoolExecutor.CallerRunsPolicy()); //任務失敗重試
	}

	public void send(Runnable task) {
		System.out.println("PoolSend start sending mail...");
		es.execute(task);//將任務放入執行緒池
	}

	public void close() {// 關閉
		es.shutdown();
	}
}
