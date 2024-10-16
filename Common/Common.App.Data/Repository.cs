using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data
{
    public interface IRepository<T>
    {
    }
    public class Repository<T> : IRepository<T> where T : class
    {
        private readonly AppDbContext _context;
        private readonly DbSet<T> _dbSet;
        protected DbSet<T> DbSet
        {
            get { return _dbSet; }
        }
        public Repository(AppDbContext context)
        {
            _context = context;
            _dbSet = _context.Set<T>();
        }

        public virtual IQueryable<T> Find(Expression<Func<T, bool>> filter = null, Func<IQueryable<T>, IOrderedQueryable<T>> sort = null, params Expression<Func<T, object>>[] inculdes)
        {
            IQueryable<T> query = SelectQuery(filter, inculdes);
            if(sort != null)
            {
                query = sort(query);
            }
            return query.AsNoTracking();
        }

        public virtual T GetByID(object id)
        {
            return _dbSet?.Find(id);
        }
        public virtual async Task<T> GetByIDAsync(object id)
        {
            return await _dbSet.FindAsync(id);
        }


        private IQueryable<T> SelectQuery(Expression<Func<T, bool>> filter, Expression<Func<T, object>>[] incudes = null)
        {
            IQueryable<T> dbQuery = _dbSet;
            if (filter != null)
            {
                try
                {
                    dbQuery = dbQuery.Where(filter);
                }
                catch (Exception ex) { }
            }
            if (incudes != null)
            {
                dbQuery = incudes.Aggregate(dbQuery, (a, b) => a.Include(b));
            }
            return dbQuery;
        }

        private void SetEntityState(EntityState state, params T[] entities)
        {
            foreach (T item in entities)
            {
                _context.Entry(item).State = state;
            }
        }
        private void Dispose(bool disposing)
        {
            if (disposing && _context != null)
            {
                _context.Dispose();
            }
        }
    }
}
