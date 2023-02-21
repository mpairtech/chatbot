const path = require('path');
const express = require('express');
const app = express();
const cors = require('cors');
const mysql = require('mysql');
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')


const brain = require('brain.js');

const config = {
  binaryThresh: 0.5,
  hiddenLayers: [3],
  activation: 'sigmoid',
  leakyReluAlpha: 0.01,
};
const net = new brain.recurrent.LSTM();



app.use(express.urlencoded({ extended: true }))
app.use(express.json())
app.use(cors())


const publicDirectory = path.join(__dirname + '/public');
app.use(express.static(path.join(__dirname, 'public')));


const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'chatbot'
});




app.get('/', (req, res) => {
  res.sendFile(publicDirectory / index.html)
})


db.query("SELECT input, output FROM disease ORDER BY input DESC", (err, result) => {
  net.train(result, {
    iterations: 10
  });
})


app.post('/train', (req, res) => {
  db.query("SELECT input, output FROM disease ORDER BY input ASC", (err, result) => {
    res.json({ 'message': result })
  })
})

app.get('/admin/', (req, res) => {
  res.sendFile(publicDirectory + '/admin.html')
})


app.post('/post', (req, res) => {
  const { input, output } = req.body;

  db.query('INSERT INTO disease SET ?', { input: input, output: output }, (err, result) => {
    res.json({ 'message': 'Added' });
    console.log(err);
  });

})


app.post('/postdoc', (req, res) => {
  const { dname, disease, dtime, address, lat, long, qualification } = req.body;

  db.query('INSERT INTO doctor SET ?', { dname: dname, disease: disease, dtime: dtime, address: address, lati: lat, longi: long, qualification: qualification }, (err, result) => {
    res.json({ 'message': 'Added' });
    console.log(err);
  });

})


app.post('/postdis', (req, res) => {
  const { disease } = req.body;

  db.query('INSERT INTO dname SET ?', { dname: disease }, (err, result) => {
    res.json({ 'message': 'Added' });
    console.log(err);
  });

})



app.post('/fdlist', (req, res) => {
  const { dname } = req.body;

  db.query('SELECT *FROM disease WHERE output = ? LIMIT 5', dname, (err, result) => {
    res.json({ 'message': result });
    console.log(err)
  });

})



app.post('/postapoint', (req, res) => {
  const { uname, dname, uphone } = req.body;

  db.query('INSERT INTO appointment SET ?', { uname: uname, dname: dname, uphone: uphone }, (err, result) => {
    res.json({ 'message': 'Appointment submited' });
    console.log(err);
  });

})




app.post('/reply', (req, res) => {
  const { msg, input } = req.body;
  const output = net.run(msg);
  
      db.query("SELECT output FROM disease WHERE input LIKE ?", ['%'+input+'%'], (err, result3) => {
        if (result3.length > 0) {

          var x = result3[0].output;
          db.query("SELECT *FROM doctor WHERE disease = ?", x, (err, result4) => {
            res.json({ 'message': true, 'dlist': result4 })
          })
        } else {
           prediction()
        }
      })




   function prediction(){
      db.query("SELECT output FROM disease WHERE output LIKE ?", ['%'+output+'%'], (err, result) => {
        if (result.length > 0) {

          db.query("SELECT *FROM doctor WHERE disease = ?", result[0].output, (err, result2) => {
            res.json({ 'message': true, 'dlist': result2 })
          })

        } else {
            res.json({ 'message': false });
        }
      })
   }

})


app.post('/dlist', (req, res) => {
  const { dname } = req.body;

  db.query("SELECT *FROM doctor WHERE disease = ?", dname, (err, result) => {
    res.json({ 'message': result })
  })

})


app.post('/delist', (req, res) => {

  db.query("SELECT *FROM dname", (err, result) => {
    res.json({ 'message': result })
  })

})



app.post('/adlist', (req, res) => {

  db.query("SELECT *FROM doctor", (err, result) => {
    res.json({ 'message': result })
  })

})


app.post('/aplist', (req, res) => {
  const { dname } = req.body;
  db.query("SELECT *FROM appointment WHERE dname = ?", dname, (err, result) => {
    res.json({ 'message': result })
  })

})

app.post('/aplistfilter', (req, res) => {
  const { dname } = req.body;
  db.query("SELECT *FROM dname WHERE dname = ?  ORDER BY id DESC", (err, result) => {
    res.json({ 'message': result })
  })

})



app.post('/slist', (req, res) => {
  db.query("SELECT *FROM disease ORDER BY id DESC", (err, result) => {
    res.json({ 'message': result })
  })
})


app.post('/newUser', (req, res) => {
  const { email, mobile, pass } = req.body;


  let hashedPassword = bcrypt.hashSync(pass, 10)
  console.log(hashedPassword);
  console.log(pass);
  db.query("INSERT INTO register SET ?", { email: email, mobile: mobile, pass: hashedPassword }, (err, results) => {
    console.log(err);
    var id = results.insertId
    console.log(id);
    const token = jwt.sign({ id }, 'Thisismysecretkey', { expiresIn: 90 })
    res.json({ 'message': err, 'token': token })


  })


})

app.get('/register', (req, res) => {
  res.sendFile(publicDirectory + '/register.html')

})


app.post('/loginUser', (req, res) => {
  const { email, pass } = req.body;

  db.query("SELECT * FROM register WHERE email = ?", [email], (err, results) => {
    if (results.length > 0) {
      console.log(results[0].pass)
      const comp = bcrypt.compareSync(pass, results[0].pass, function (err, result) {
        return result;
      })
      console.log(pass)
      if (comp) {
        const id = results[0].id;
        const token = jwt.sign({ id }, 'Thisismysecretkey', { expiresIn: '90d' })
        res.json({ 'message': true, 'token': token })
      } else {
        res.json({ 'message': 'fkr vua' })
      }
    } else {
      res.json({ 'message': 'Email do not exists' })
    }




  })


})

app.get('/login', (req, res) => {
  res.sendFile(publicDirectory + '/login.html')

})




app.listen('5000', (req, res) => {
  console.log('Server running on PORT 5000');
})

