﻿using Common.App.Data.Entities;
using Common.App.Data.Entities.App;
using Common.App.Data.Entities.Employee;
using Common.App.Data.Entities.Masters;
using Common.App.Data.Entities.Salary;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data
{
    public class AppDbContext : DbContext
    {
        private readonly IContextHelper _contextHelper;
        public AppDbContext(DbContextOptions<AppDbContext> options, IContextHelper contextHelper) : base(options)
        {
            _contextHelper = contextHelper;
        }
        public DbSet<Salary_Component> Salary_Component { get; set; }
        public DbSet<Salary_Structure> Salary_Structure { get; set; }
        public DbSet<Salary_StructureTran> Salary_StructureTran { get; set; }
        public DbSet<Salary_Assignment> Salary_Assignment { get; set; }
        public DbSet<Salary_AssignmentBreakUp> Salary_AssignmentBreakUp { get; set; }
        public DbSet<Masters_Country> Masters_Country { get; set; }
        public DbSet<Masters_Region> Masters_Region { get; set; }
        public DbSet<Masters_State> Masters_State { get; set; }
        public DbSet<Masters_City> Masters_City { get; set; }
        public DbSet<Masters_Area> Masters_Area { get; set; }
        public DbSet<Masters_Designation> Masters_Designation { get; set; }
        public DbSet<Masters_Department> Masters_Department { get; set; }
        public DbSet<Masters_Company> Masters_Company { get; set; }
        public DbSet<Master_Emp> Master_Emp { get; set; }
        public DbSet<AppUsers> AppUsers { get; set; }
        public DbSet<EMP_Documents> EMP_Documents { get; set; }
        public override int SaveChanges()
        {
            var LoginID= _contextHelper.GetLoginID();
            if (!string.IsNullOrEmpty(LoginID))
            {
                var entries = ChangeTracker.Entries().Where(e => e.State == EntityState.Modified || e.State == EntityState.Added);
                foreach (var entityEntry in entries)
                {
                    var changeOrAddedItem = entityEntry.Entity as BaseEntity;
                    if (changeOrAddedItem != null)
                    {
                        if (entityEntry.State == EntityState.Added)
                        {
                            changeOrAddedItem.IsDeleted = 0;
                            changeOrAddedItem.Createdby = Convert.ToInt32(LoginID);
                            changeOrAddedItem.CreatedDate = DateTime.Now;
                            changeOrAddedItem.EntrySource = DataConstant.EntrySource;
                        }
                        else if (entityEntry.State == EntityState.Modified)
                        {
                            var CreatedOnProperty = entityEntry.Property("CreatedDate");
                            if (CreatedOnProperty != null)
                            {
                                CreatedOnProperty.IsModified = false;
                            }
                            var CreatedByProperty = entityEntry.Property("Createdby");
                            if (CreatedByProperty != null)
                            {
                                CreatedByProperty.IsModified = false;
                            }
                            var IsDeletedProperty = entityEntry.Property("IsDeleted");
                            if (IsDeletedProperty != null)
                            {
                                IsDeletedProperty.IsModified = false;
                            }
                        }
                        changeOrAddedItem.Modifiedby = Convert.ToInt32(LoginID);
                        changeOrAddedItem.ModifiedDate = DateTime.Now;
                    }
                }
            }
            return base.SaveChanges();
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            List<Type> typesToRegister = new List<Type>();
            typesToRegister.AddRange(Assembly.GetExecutingAssembly().DefinedTypes.Select(t => t.AsType()));
            RegisterEnTities(modelBuilder,typesToRegister);
        }

        private static void RegisterEnTities(ModelBuilder modelBuilder,IEnumerable<Type> typesToRegister)
        {
            var entityTypes = typesToRegister.Where(x => x.GetTypeInfo().IsSubclassOf(typeof(BaseEntity)) && !x.GetTypeInfo().IsAbstract);
            foreach (var type in entityTypes)
            {
                modelBuilder.Entity(type);
            }
        }
    }

    
}
