using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SmartphoneShopping.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmartphoneShopping.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        [HttpGet]
        public List<User> GetAllUsers()
        {
            using(var context = new SmartphoneShoppingContext())
            {
                List<User> UserList = context.Users.ToList();
                return UserList;
            }
        }
    }
}
