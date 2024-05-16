const express = require('express');
const path = require('path');
const con = require('./public/config/db.js');
const bcrypt = require('bcrypt');
const app = express();

app.use('/public', express.static(path.join(__dirname, 'public')));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  next();
});

app.get("/password/:pass", function (req, res) {
  const password = req.params.pass;
  const saltRounds = 10;
  bcrypt.hash(password, saltRounds, function (err, hash) {
    if (err) {
      return res.status(500).send("Error hashing password");
    }
    console.log("Hash to store for password", password, "is", hash);
    res.send(hash);
  });
});

app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname, '/public/homestu.html'));

});
app.post('/login', function (req, res) {

  const email = req.body.email;
  const raw = req.body.password;
  const sql = "SELECT id, email, password, role from user WHERE email =?";
  con.query(sql, [email], function (err, result) {
    if (err) {
      res.status(500).send('Server Error');
    }
    else {
      if (result.length != 1) {
        res.status(401).send('Login Failed: wrong Username');
      }
      else {
        const hash = result[0].password;
        console.log("fetch", result[0]);
        bcrypt.compare(raw, hash, function (err, same) {
          if (err) {
            res.status(500).send('Server Error');
          }
          else {
            // Inside your login endpoint
            if (same) {
              const userId = result[0].id; // Retrieve user ID
              const role = result[0].role;
              if (result[0].role == 1) {
                res.status(200).send({ userId: userId, redirect: '/browseuser' });
              }
              else if (result[0].role == 2) {
                res.status(200).send({ userId: userId, redirect: '/browsestaff' });
              }
              else {
                res.status(200).send({ userId: userId, redirect: '/browselender' });
              }
            }

            else {
              res.status(401).send('Login Failed: wrong Password');
            }
          }
        });
      }
    }
  });
});


app.post('/register', function (req, res) {
  const { name, major, school, email, password } = req.body;
  console.log(name, major, school, email, password);
  // Validate form data
  if (!name || !major || !school || !email || !password) {
    return res.status(400).send('Please fill in all fields');
  }


  bcrypt.hash(password, 10, function (err, hash) {
    if (err) {
      return res.status(500).send('Error hashing password');
    }

    const sql = "INSERT INTO `user` (`id`, `name`, `major`, `school`, `email`, `password`) VALUES (NULL, ?, ?, ?, ?, ?)";
    con.query(sql, [name, major, school, email, hash], function (err, result) {
      if (err) {
        console.error('Error inserting user:', err);
        return res.status(500).send('Server error');
      }

      res.status(200).send('/login');
    });

  });
});
app.post('/checkstu', function (req, res) {
  const userId = req.body.userId;
  console.log("userID", userId);
  const sql = `
    SELECT b.id AS book_id, b.name AS book_name, b.image AS book_image, b.status AS book_status
    FROM request r
    INNER JOIN book b ON r.book_id = b.id
    WHERE r.borrower_id = ?`;

  con.query(sql, [userId], function (err, result) {
    if (err) {
      console.error('Error fetching requests:', err);
      return res.status(500).send('Server error');
    }
    res.json(result);
    console.log("Data", result);
  });
});

app.post('/lendercheck', function (req, res) {
  const lenderId = req.body.userId;
  console.log("Lender ID:", lenderId);
  const sql = `
    SELECT b.id AS book_id, b.name AS book_name, b.image AS book_image, b.status
    FROM request r
    INNER JOIN book b ON r.book_id = b.id
    WHERE r.lender_id = ? AND b.status = 'pending'`;

  con.query(sql, [lenderId], function (err, result) {
    if (err) {
      console.error('Error fetching requests:', err);
      return res.status(500).send('Server error');
    }
    if (result.length === 0) {
      console.log('No pending requests found for lender ID:', lenderId);
      return res.status(404).send('No pending requests found');
    }
    res.json(result);
    console.log("Data", result);
  });
});

app.post('/updatebookstatus', function (req, res) {
  const bookId = req.body.bookId;
  const status = req.body.status;

  const sql = `
      UPDATE book
      SET status = ?
      WHERE id = ?`;

  con.query(sql, [status, bookId], function (err, result) {
      if (err) {
          console.error('Error updating book status:', err);
          return res.status(500).send('Server error');
      }
      console.log('Book status updated successfully');
      res.json({ message: 'Book status updated successfully' });
  });
});


app.post('/browseuser', function (req, res) {
  const userId = req.body.userId;
  console.log("userID", userId);

  if (!userId) {
    console.error('Error: userId is missing in the request body');
    return res.status(400).send('User ID is missing');
  }

  const sql = `
      SELECT id AS book_id, name AS book_name, image AS book_image, status AS book_status
      FROM book
      WHERE status = 'available'`;

  con.query(sql, function (err, result) {
    if (err) {
      console.error('Error fetching available books:', err);
      return res.status(500).send('Server error');
    }
    if (result.length === 0) {
      console.log('No requests found for user ID:', userId);
      return res.status(404).send('No requests found');
    }
    res.json(result);
    console.log("Data", result);
  });
});


const PORT = 3000;
app.listen(PORT, function () {
  console.log('Server is running at port ' + PORT);
});

app.get('/login', function (req, res) {
  res.sendFile(path.join(__dirname, '/public/login.html'));
})

app.get('/browseuser', function (req, res) {
  res.sendFile(path.join(__dirname, '/public/indexstu.html'));
})

app.get('/browsestaff', function (req, res) {
  res.sendFile(path.join(__dirname, '/public/indexstaff.html'));
})

app.get('/browselender', function (req, res) {
  res.sendFile(path.join(__dirname, '/public/indexlender.html'));
})
app.get('/register', function (req, res) {
  res.sendFile(path.join(__dirname, '/public/register.html'));
})
app.get('/checkstu', function (req, res) {
  res.sendFile(path.join(__dirname, '/public/checkstu.html'));
})
app.get('/lendercheck', function (req, res) {
  res.sendFile(path.join(__dirname, '/public/lendercheck.html'));
})
app.get('/historylender', function (req, res) {
  res.sendFile(path.join(__dirname, '/public/historylender.html'));
})
app.get('/dashboardlender', function (req, res) {
  res.sendFile(path.join(__dirname, '/public/dashboardlender.html'));
})
app.get('/borrowingreq', function (req, res) {
  res.sendFile(path.join(__dirname, '/public/borrowingreq.html'));
})
