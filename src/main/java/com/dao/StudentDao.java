package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.dto.Student;

public class StudentDao 
{

		EntityManagerFactory emf=Persistence.createEntityManagerFactory("dev");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		public void saveStudent(Student st)
		{
			et.begin();
			em.persist(st);
			et.commit();
		}
		
		public List<Student> findAll()
		{
			Query q=em.createQuery("select s from Student s");
			List<Student> list=q.getResultList();
			return list;
			
		}
		public Student findStudentByid(int id)
		{
			return em.find(Student.class, id);
		}
		public  void UpdateStudent(Student st)
		{
			et.begin();
			em.merge(st);
			et.commit();
		}
		public void delteStudent(Student stu)
		{
			et.begin();
			em.remove(stu);
			et.commit();
		}
		

	}


