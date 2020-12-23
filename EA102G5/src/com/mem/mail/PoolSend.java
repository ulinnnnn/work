package com.mem.mail;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class PoolSend {
	BlockingQueue<Runnable> workQueue;//���Ȧ�C
	ExecutorService es;//�������������

	public PoolSend() {
		workQueue = new LinkedBlockingQueue<>();//�c�y�L�ɪ����Ȧ�C,�귽����,�z�ץi�H�䴩�L�u�ӥ���
		es = new ThreadPoolExecutor(2, 4, //2 core; 4 max
				30,TimeUnit.SECONDS, workQueue, //30s keep alive
				new ThreadPoolExecutor.CallerRunsPolicy()); //���ȥ��ѭ���
	}

	public void send(Runnable task) {
		System.out.println("PoolSend start sending mail...");
		es.execute(task);//�N���ȩ�J�������
	}

	public void close() {// ����
		es.shutdown();
	}
}
