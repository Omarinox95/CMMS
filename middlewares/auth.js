// middlewares/auth.js
function isLoggedIn(req, res, next) {
  if (req.session.user) {
    return next();
  }
  res.redirect('/');
}

function isAdmin(req, res, next) {
  if (req.session.user && req.session.user.role === 'admin') {
    return next();
  }
  res.status(403).send('Acceso denegado: Solo admins.');
}

function isClinicalEngineer(req, res, next) {
  if (req.session.user && req.session.user.role === 'clinicalEngineer') {
    return next();
  }
  res.status(403).send('Acceso denegado: Solo personal clínico.');
}
function isMedicalStaff(req, res, next) {
  if (req.session.user && req.session.user.role === 'medicalStaff') {
    return next();
  }
  res.status(403).send('Acceso denegado: Solo personal médico.');
}


module.exports = { isLoggedIn, isAdmin, isClinicalEngineer, isMedicalStaff };
