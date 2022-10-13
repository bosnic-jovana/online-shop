using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Application.UseCases
{
    public interface IUseCase
    {
        public int Id { get; }
        string Name { get; }
    }
    public interface IQuery<TRequest, TResult> : IUseCase
    {
        TResult Execute(TRequest search);
    }
    public interface ICommand<TRequest> : IUseCase
    {
        void Execute(TRequest request);
    }
}
