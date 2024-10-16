using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data
{
    public interface IUnitOfWork
    {
    }
    public class UnitOfWork : IUnitOfWork
    {
        private readonly AppDbContext _context;
        private readonly Dictionary<Type, object> repos;
        public UnitOfWork(AppDbContext context)
        {
            _context = context;
            repos = new Dictionary<Type, object>();
        }

        public IRepository<T> GetRepository<T>() where T : class
        {
            IRepository<T> repository = null;
            if (repos.ContainsKey(typeof(T)))
            {
                repository = new Repository<T>(_context);
                repos.Add(typeof(T), repository);
            }
            else
            {
                repository = repos[typeof(T)] as Repository<T>;
            }
            return repository;
        }
    }

}
