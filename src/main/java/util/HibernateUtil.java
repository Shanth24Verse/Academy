package util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import persistence.Classes;
import persistence.Student;
import persistence.Subject;
import persistence.Teacher;

public class HibernateUtil {

	public static SessionFactory buildSessionFactory() {

		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml")
				.addAnnotatedClass(Teacher.class)
				.addAnnotatedClass(Subject.class)
				.addAnnotatedClass(Classes.class)
				.addAnnotatedClass(Student.class)
				.buildSessionFactory();
				
		return sessionFactory;
	}
}