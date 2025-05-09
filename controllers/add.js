const bcrypt = require('bcryptjs')
const Department = require('../models/department')
const AgentSupplier = require('../models/agent_supplier')
const ClinicalEngineer=require('../models/clinical_engineer')
const Equipment =require('../models/equipment')
const SpareParts = require('../models/spare_part')
const BreakDowns = require('../models/break_down')
const WorkOrders = require('../models/work_order')
const Maintenance = require('../models/maintenance')
const Category = require('../models/category');
const client = require('../emqx/emqx-connection');

//añadido 06/05/205
// Añadido 06/05/2025
const ReceptionStatus = require('../models/ReceptionStatus');
const AcquisitionType = require('../models/AcquisitionType');
/*
exports.getAddEquipment = async (req, res) => {
  try {
    // Obtenemos las listas de los modelos
    const [receptionStatusList, acquisitionTypeList] = await Promise.all([
      ReceptionStatus.findAll(),
      AcquisitionType.findAll()
    ]);


    // Verificar los datos en la consola
    console.log("receptionStatusList:", receptionStatusList); // Verifica los datos de los estados de recepción
    console.log("acquisitionTypeList:", acquisitionTypeList); // Verifica los datos de tipos de adquisición

    // Pasamos los datos convertidos a la vista
    res.render('equipment', {
      layout: 'main-layout',
      pageTitle: 'Agregar Equipo',
      receptionStatusList: receptionStatusList,
      acquisitionTypeList: acquisitionTypeList
    });
  } catch (err) {
    // Manejo de errores
    console.error('Error al cargar listas:', err);
    res.render('error', {
      layout: false,
      pageTitle: 'Error',
      message: 'No se pudieron cargar los datos de estado de recepción o tipo de adquisición'
    });
  }
};*/




exports.addDepartment=(req,res)=>{
 code=req.body.Code
 name=req.body.Name
 location=req.body.Location
 Department.create({Code:code,Name:name,Location:location}).then(dep =>{
 res.redirect('/department');
 }).catch(err=> {
    console.log("ERROR!!!!!!",err)
    })


}


exports.addAgentSupplier=(req,res)=>{
    id=req.body.Id
    name=req.body.Name
    address=req.body.Address
    phone=req.body.Phone
    email=req.body.Email
    notes=req.body.Notes
    AgentSupplier.findByPk(id).then(agentSupplier => {
        if(agentSupplier){
            agentSupplier.Id=id;
            agentSupplier.Name=name;
            agentSupplier.Address=address;
            agentSupplier.Phone=phone;
            agentSupplier.Email=email;
            agentSupplier.Notes=notes;
            return agentSupplier.save();
        }
        else{
            return AgentSupplier.create({Id:id,Name:name,Adress:address,
                    Phone:phone,Email:email,Notes:notes})
        }
   
   }).then(r => res.redirect('/agentSupplier'))
   .catch(err => console.log("ERROR!!!!!!",err))
}


exports.addClinicalEngineer=(req,res)=>{
    dssn=req.body.DSSN
    fname=req.body.FName
    lname=req.body.LName
    address=req.body.Address
    phone=req.body.Phone
    email=req.body.Email
    if(req.body.edit){
        image=req.body.Image
    }
    else{
        image=req.file.path.split('\\')
        if (image.length>1)
            image=req.file.path.split('\\').pop()
        else    
            image=req.file.path.split('/').pop()

    }
    age=req.body.Age
    workhours=req.body.workHours
    department=req.body.Department
    var departmentCode=null
    if(req.body.Password)   
    bcrypt.genSalt(10, (err, salt) => {
        bcrypt.hash(req.body.Password, salt, (err, hash) => {
            pass=hash 
        });
        
    });
    
    
    
    Department.findOne({where:{Name:department}}).then(department => { 
        if (department){

            departmentCode=department.Code
            ClinicalEngineer.findByPk(dssn).then(clinicalEngineer=>{
                if(clinicalEngineer){
                    clinicalEngineer.DSSN=dssn
                    clinicalEngineer.FName=fname
                    clinicalEngineer.LName=lname
                    clinicalEngineer.Adress=address
                    clinicalEngineer.Phone=phone
                    clinicalEngineer.Email=email
                    clinicalEngineer.Image=image
                    clinicalEngineer.Age=age
                    clinicalEngineer.WorkHours=workhours
                    clinicalEngineer.DepartmentCode=departmentCode
                    clinicalEngineer.save().then(r => res.redirect('/clinicalEngineer'))
                }
                else{
                    
                    ClinicalEngineer.create({DSSN:dssn,FName:fname,
                            LName:lname,Adress:address,Phone:phone,Image:image,
                            Email:email,Age:age,WorkHours:workhours,
                            DepartmentCode:departmentCode,Password:pass
                        }).then(r => res.redirect('/clinicalEngineer'))
                }
            })
        }
        else{
            res.render('error',{layout:false,pageTitle:'Error',href:'/clinicalEngineer',message:'Sorry !!! Could Not Get this Department'})                

        }
    })
    .catch(err =>res.render('error',{layout:false,pageTitle:'Error',href:'/equipment',message:'Sorry !!! Could Not Get Engineers'})                
    )

}

exports.addEquipment = (req, res) => {
    console.log("Datos recibidos en el backend:", req.body);
    
    // Recuperar los datos del equipo
    const code = req.body.Code;
    const name = req.body.Name;
    const cost = req.body.Cost;
    const model = req.body.Model;
    const serialnumber = req.body.SerialNumber;
    const installationdate = req.body.InstallationDate;
    const arrivaldate = req.body.ArrivalDate;
    const warrantydate = req.body.WarrantyDate;
    const manufacturer = req.body.Manufacturer;
    const location = req.body.Location;
    const department = req.body.Department;
    const agent = req.body.Agent;
    const pm = req.body.PM;
    const notes = req.body.Notes;
    const software = req.body.Software;
    const softwareVersion = req.body.SoftwareVersion;
    const softwarePass = req.body.SoftwarePass;
    const networkAddress = req.body.NetworkAddress;
    const assetStatus = req.body.AssetStatus;
    const insuranceStatus = req.body.InsuranceStatus;
    const funtionalStatus = req.body.FuntionalStatus;
    const assetInitialDate = req.body.AssetInitialDate;
    const insuranceInitialDate = req.body.InsuranceInitialDate;
    const receptionStatus = req.body.ReceptionStatusId; // este es un ID
    const acquisitionType = req.body.AcquisitionType; // este es un ID

    let image;
    if (req.body.edit) {
        image = req.body.Image;
    } else {
        image = req.file.path.split('\\').pop(); // Aseguramos que obtengamos el nombre del archivo
    }

    let departmentCode = null;
    let agentCode = null;

    // Obtener los valores de ReceptionStatus y AcquisitionType
    Promise.all([
        ReceptionStatus.findAll(), 
        AcquisitionType.findAll()
    ])
    .then(([receptionStatuses, acquisitionTypes]) => {
        const plainReceptionStatuses = receptionStatuses.map(rs => ({
            Id: rs.Id,
            Name: rs.Name
        }));
    
        const plainAcquisitionTypes = acquisitionTypes.map(at => ({
            Id: at.Id,
            Name: at.Name
        }));
    
        res.render('equipment', {
            receptionStatuses: plainReceptionStatuses,
            acquisitionTypes: plainAcquisitionTypes
        });
    
        // Continúa con la lógica de creación
    

        // Luego puedes continuar con el proceso de creación del equipo
        Department.findOne({ where: { Name: department } })
            .then(department => {
                if (department) {
                    departmentCode = department.Code;
                    AgentSupplier.findOne({ where: { Id: agent } })
                        .then(agent => {
                            if (agent) {
                                agentCode = agent.Id;
                                ReceptionStatus.findOne({ where: { Id: receptionStatus } })
                                    .then(receptionStatus => {
                                        if (receptionStatus) {
                                            receptionID = receptionStatus.Id;
                                            console.log("Estados de recepcion:", receptionID);

                                            // Crear el equipo
                                            Equipment.create({
                                                Code: code,
                                                Name: name,
                                                Cost: cost,
                                                Image: image,
                                                Model: model,
                                                SerialNumber: serialnumber,
                                                InstallationDate: installationdate,
                                                ArrivalDate: arrivaldate,
                                                WarrantyDate: warrantydate,
                                                Manufacturer: manufacturer,
                                                Location: location,
                                                Notes: notes,
                                                PM: pm,
                                                DepartmentCode: departmentCode,
                                                AgentSupplierId: agentCode,
                                                Software: software,
                                                SoftwareVersion: softwareVersion,
                                                SoftwarePass: softwarePass,
                                                NetworkAddress: networkAddress,
                                                AssetStatus: assetStatus,
                                                InsuranceStatus: insuranceStatus,
                                                FuntionalStatus: funtionalStatus,
                                                AssetInitialDate: assetInitialDate,
                                                InsuranceInitialDate: insuranceInitialDate,
                                                ReceptionStatusId: receptionID,
                                                AcquisitionTypeId: acquisitionType
                                            })
                                            .then(newEquipment => {
                                                console.log("Nuevo equipo creado:", newEquipment);

                                                const spareParts = typeof req.body.spareParts === "string" ? JSON.parse(req.body.spareParts) : req.body.spareParts;

                                                if (!Array.isArray(spareParts)) {
                                                    console.error("Error: spareParts no es un array válido", spareParts);
                                                    return res.status(400).json({ error: "Formato incorrecto de repuestos." });
                                                }

                                                console.log("Repuestos seleccionados:", spareParts);

                                                if (spareParts && spareParts.length > 0) {
                                                    newEquipment.addSpareParts(spareParts, { through: 'EquipmentSpareParts' })
                                                        .then(() => {
                                                            console.log("Repuestos asociados correctamente");
                                                            res.redirect('/equipment');  // Redirigir después de crear el equipo
                                                        })
                                                        .catch(err => {
                                                            console.log("Error al asociar repuestos:", err);
                                                            res.render('error', { layout: false, pageTitle: 'Error', message: 'No se pudieron asociar los repuestos' });
                                                        });
                                                } else {
                                                    res.redirect('/equipment');
                                                }
                                            })
                                            .catch(err => {
                                                console.log("Error al crear el equipo:", err);
                                                res.render('error', { layout: false, pageTitle: 'Error', message: 'No se pudo crear el equipo' });
                                            });
                                        } else {
                                            res.render('error', { layout: false, pageTitle: 'Error', message: 'No se encontró estado de recepcion' });
                                        }
                                    })
                                    .catch(err => {
                                        console.log("Error al encontrar el estado de recepcion:", err);
                                        res.render('error', { layout: false, pageTitle: 'Error', message: 'No se encontró estado de recepcion' });
                                    });
                            } else {
                                res.render('error', { layout: false, pageTitle: 'Error', message: 'No se encontró el proveedor' });
                            }
                        })
                        .catch(err => {
                            console.log("Error al encontrar el proveedor:", err);
                            res.render('error', { layout: false, pageTitle: 'Error', message: 'No se encontró el proveedor' });
                        });
                } else {
                    res.render('error', { layout: false, pageTitle: 'Error', message: 'No se encontró el departamento' });
                }
            })
            .catch(err => {
                console.log("Error al encontrar el departamento:", err);
                res.render('error', { layout: false, pageTitle: 'Error', message: 'No se pudo encontrar el departamento' });
            });
    })
    .catch(err => {
        console.log("Error al obtener datos de recepción y adquisición:", err);
        res.render('error', { layout: false, pageTitle: 'Error', message: 'Error al obtener los datos de recepción y adquisición' });
    });
};

/*exports.addEquipment = (req, res) => {
    console.log("Datos recibidos en el backend:", req.body);
    
    // Recuperar los datos del equipo
    const code = req.body.Code;
    const name = req.body.Name;
    const cost = req.body.Cost;
    const model = req.body.Model;
    const serialnumber = req.body.SerialNumber;
    const installationdate = req.body.InstallationDate;
    const arrivaldate = req.body.ArrivalDate;
    const warrantydate = req.body.WarrantyDate;
    const manufacturer = req.body.Manufacturer;
    const location = req.body.Location;
    const department = req.body.Department;
    const agent = req.body.Agent;
    const pm = req.body.PM;
    const notes = req.body.Notes;
    const software = req.body.Software;
    const softwareVersion = req.body.SoftwareVersion;
    const softwarePass = req.body.SoftwarePass;
    const networkAddress = req.body.NetworkAddress;
    const assetStatus = req.body.AssetStatus;
    const insuranceStatus = req.body.InsuranceStatus;
    const funtionalStatus = req.body.FuntionalStatus;
    //añadido 06/05/25
    const assetInitialDate = req.body.AssetInitialDate;
    const insuranceInitialDate = req.body.InsuranceInitialDate;
    const receptionStatus = req.body.ReceptionStatusId; // este es un ID
    const acquisitionType = req.body.AcquisitionType; // este es un ID
    


    let image;
    if (req.body.edit) {
        image = req.body.Image;
    } else {
        image = req.file.path.split('\\').pop(); // Aseguramos que obtengamos el nombre del archivo
    }

    let departmentCode = null;
    let agentCode = null;

    //añadido 08/05
    let receptionID=null;

    // Encontrar el departamento y el agente
    Department.findOne({ where: { Name: department } })
        .then(department => {
            if (department) {
                departmentCode = department.Code;
                AgentSupplier.findOne({ where: { Id: agent } })
                    .then(agent => {
                        if (agent) {
                            agentCode = agent.Id;
                            ReceptionStatus.findOne({ where: { Id: receptionStatus } })
                                .then(receptionStatus => {
                                    if (receptionStatus) {
                                        receptionID = receptionStatus.Id;
                                        console.log("Estados de recepcion:", receptionID);

                                        // Crear el equipo
                                        Equipment.create({
                                            Code: code,
                                            Name: name,
                                            Cost: cost,
                                            Image: image,
                                            Model: model,
                                            SerialNumber: serialnumber,
                                            InstallationDate: installationdate,
                                            ArrivalDate: arrivaldate,
                                            WarrantyDate: warrantydate,
                                            Manufacturer: manufacturer,
                                            Location: location,
                                            Notes: notes,
                                            PM: pm,
                                            DepartmentCode: departmentCode,
                                            AgentSupplierId: agentCode,
                                            Software: software,
                                            SoftwareVersion: softwareVersion,
                                            SoftwarePass: softwarePass,
                                            NetworkAddress: networkAddress,
                                            AssetStatus: assetStatus,
                                            InsuranceStatus: insuranceStatus,
                                            FuntionalStatus: funtionalStatus,

                                            //añadido 06/05/25
                                            AssetInitialDate: assetInitialDate,
                                            InsuranceInitialDate: insuranceInitialDate,
                                            ReceptionStatusId: receptionID,
                                            AcquisitionTypeId: acquisitionType
                                        })
                                        .then(newEquipment => {
                                            console.log("Nuevo equipo creado:", newEquipment);

                                            // Asegurarse de que spareParts sea un array, incluso si solo se selecciona un repuesto
                                            //
                                            // const spareParts = Array.isArray(req.body.spareParts) ? req.body.spareParts : [req.body.spareParts];
                                            // Asegurar que spareParts sea un array antes de usarlo
                                            const spareParts = typeof req.body.spareParts === "string" ? JSON.parse(req.body.spareParts) : req.body.spareParts;

                                            // Validar que spareParts sea realmente un array
                                            if (!Array.isArray(spareParts)) {
                                                console.error("Error: spareParts no es un array válido", spareParts);
                                                return res.status(400).json({ error: "Formato incorrecto de repuestos." });
                                            }

                                            console.log("Repuestos seleccionados:", spareParts);

                                            // Asociar los repuestos seleccionados al nuevo equipo
                                            if (spareParts && spareParts.length > 0) {
                                                // Asociar cada repuesto con el equipo
                                                newEquipment.addSpareParts(spareParts, { through: 'EquipmentSpareParts' } )
                                                    .then(() => {
                                                        console.log("Repuestos asociados correctamente");
                                                        res.redirect('/equipment');  // Redirigir después de crear el equipo
                                                    })
                                                    .catch(err => {
                                                        console.log("Error al asociar repuestos:", err);
                                                        res.render('error', { layout: false, pageTitle: 'Error', message: 'No se pudieron asociar los repuestos' });
                                                    });
                                            } else {
                                                res.redirect('/equipment');  // Si no se seleccionaron repuestos, redirigir igualmente
                                            }
                                        })
                                        .catch(err => {
                                            console.log("Error al crear el equipo:", err);
                                            res.render('error', { layout: false, pageTitle: 'Error', message: 'No se pudo crear el equipo' });
                                        });
                                    } else {
                                        res.render('error', { layout: false, pageTitle: 'Error', message: 'No se encontró estado de recepcion' });
                                    }
                                            })
                                    .catch(err => {
                                        console.log("Error al encontrar el estado de recepcion:", err);
                                        res.render('error', { layout: false, pageTitle: 'Error', message: 'No se encontró estado de recepcion' });
                                    });    
                                } else {
                                    res.render('error', { layout: false, pageTitle: 'Error', message: 'No se encontró el proveedor' });
                                }
                            })
                    .catch(err => {
                        console.log("Error al encontrar el proveedor:", err);
                        res.render('error', { layout: false, pageTitle: 'Error', message: 'No se encontró el proveedor' });
                    });
            } else {
                res.render('error', { layout: false, pageTitle: 'Error', message: 'No se encontró el departamento' });
            }
        })
        .catch(err => {
            console.log("Error al encontrar el departamento:", err);
            res.render('error', { layout: false, pageTitle: 'Error', message: 'No se pudo encontrar el departamento' });
        });
};
*/

exports.addSpareParts = (req, res) => {
    console.log("Repuestos que se van a asociar:", spareParts);

    const code = req.body.Code;
    const name = req.body.Name;
    const amount = req.body.Amount;
    const agentId = req.body.AgentSupplierId;
    const equipmentCode = req.body.EquipmentCode;  // Aquí se obtiene el código del equipo
    const categoryId = req.body.CategoryId;

    let image;
    if (req.body.edit) {
        image = req.body.Image;
    } else {
        image = req.file.path.split('\\').pop();
    }

    // Buscar al proveedor
    AgentSupplier.findOne({ where: { Id: agentId } })
        .then(agent => {
            if (agent) {
                // Buscar el repuesto por código
                SpareParts.findByPk(code).then(part => {
                    if (part) {
                        // Si el repuesto existe, actualizamos sus detalles
                        part.Name = name;
                        part.Amount = amount;
                        part.AgentSupplierId = agentId;
                        part.CategoryId = categoryId;
                        part.Image = image;
                        part.save().then(p => {
                            // Una vez actualizado el repuesto, asociamos el repuesto con el equipo
                            Equipment.findOne({ where: { Code: equipmentCode } })
                                .then(equipment => {
                                    if (equipment) {
                                        // Asociar el repuesto al equipo en la tabla intermedia EquipmentSpareParts
                                        equipment.addSparePart(part)  // Usa 'addSparePart' (singular)
                                            .then(() => {
                                                console.log("Repuesto asociado correctamente con el equipo");
                                                res.redirect('/sparePart');
                                            })
                                            .catch(err => {
                                                console.log("Error al asociar repuesto:", err);
                                                res.render('error', { layout: false, pageTitle: 'Error', message: 'No se pudo asociar el repuesto al equipo' });
                                            });
                                    } else {
                                        res.render('error', { layout: false, pageTitle: 'Error', message: 'Equipo no encontrado' });
                                    }
                                })
                                .catch(err => {
                                    console.log("Error al encontrar el equipo:", err);
                                    res.render('error', { layout: false, pageTitle: 'Error', message: 'No se pudo encontrar el equipo' });
                                });
                        });
                    } else {
                        // Si el repuesto no existe, creamos uno nuevo
                        SpareParts.create({
                            Code: code,
                            Name: name,
                            Amount: amount,
                            AgentSupplierId: agentId,
                            Image: image,
                            EquipmentCode: equipmentCode,  // Este campo ya no se actualiza directamente
                            CategoryId: categoryId
                        })
                            .then(newPart => {
                                // Asociar el repuesto recién creado con el equipo
                                Equipment.findOne({ where: { Code: equipmentCode } })
                                    .then(equipment => {
                                        if (equipment) {
                                            equipment.addSparePart(newPart)  // Usa 'addSparePart' (singular)
                                                .then(() => {
                                                    console.log("Nuevo repuesto asociado correctamente");
                                                    res.redirect('/sparePart');
                                                })
                                                .catch(err => {
                                                    console.log("Error al asociar nuevo repuesto:", err);
                                                    res.render('error', { layout: false, pageTitle: 'Error', message: 'No se pudo asociar el nuevo repuesto' });
                                                });
                                        } else {
                                            res.render('error', { layout: false, pageTitle: 'Error', message: 'Equipo no encontrado' });
                                        }
                                    });
                            })
                            .catch(err => {
                                console.log("Error al crear el repuesto:", err);
                                res.render('error', { layout: false, pageTitle: 'Error', message: 'No se pudo crear el repuesto' });
                            });
                    }
                });
            } else {
                res.render('error', { layout: false, pageTitle: 'Error', message: 'No se encontró el proveedor' });
            }
        })
        .catch(err => {
            console.log("Error al encontrar el proveedor:", err);
            res.render('error', { layout: false, pageTitle: 'Error', message: 'Error al obtener el proveedor' });
        });
};


/////


exports.addBreakDown=(req,res)=>{
    code=req.body.Code
    reason=req.body.Reason
    date=req.body.DATE
    equipmentId=req.body.EquipmentCode
    Equipment.findOne({where:{Code:equipmentId}}).then(Equipment =>{
        if(Equipment){
            BreakDowns.findByPk(code).then(breakD=>{
                if(breakD){
                    breakD.Code=code
                    breakD.Reason=reason
                    breakD.DATE=date
                    breakD.EquipmentCode=equipmentId
                    breakD.save().then(res.redirect('/breakDown'))
                }
        
                BreakDowns.create({Code:code,Reason:reason,DATE:date,EquipmentCode:equipmentId})
                .then(res.redirect('/breakDown'))
                .catch(err=> {
                    console.log("ERROR!!!!!!",err)
                    })
                })
        }
        else
         return res.render('error',{layout:false,pageTitle:'Error',href:'/breakDown',message:'Sorry !!! Could Not Get this Equipment'})
        
    })

}

//ordenes de trabajo 
exports.addWorkOrder=(req,res) => {
    code =req.body.Code
    cost=req.body.Cost
    startDate=req.body.StartDATE
    endDate=req.body.EndDATE
    description=req.body.Description
    priority = req.body.Priority
    equipmentId=req.body.EquipmentCode
    engineerId=req.body.ClinicalEngineerDSSN
    solution=req.body.Solution //solución de la orden de trabajo
    workdate=req.body.Workdate  //fecha de realizacion del trabajo
    var equId=null
    var engId=null
    
    Equipment.findOne({where:{Code:equipmentId}}).then(equipment => { 
        if(equipment){
            equId=equipment.Code
            ClinicalEngineer.findOne({where:{DSSN:engineerId}}).then(clinicalengineer =>{
                if(clinicalengineer){
                    engId = clinicalengineer.DSSN
                    WorkOrders.findByPk(code).then(workorder=>{
                        if(workorder){
                            workorder.StartDate=startDate
                            workorder.EndDate=endDate
                            workorder.Description=description
                            workorder.Cost=cost
                            workorder.EquipmentCode=equId
                            workorder.ClinicalEngineerDSSN=engId
                            workorder.Priority=priority
                            workorder.Solution=solution
                            workorder.Workdate=workdate
                            workorder.save().then(workorder => res.redirect('/workOrder'))
                        }
                        else {
                            WorkOrders.create({StartDate:startDate,EndDate:endDate,Description:description,
                            Cost:cost,EquipmentCode:equId,ClinicalEnginnerDSSN:engId,Priority:priority, 
                            Solution:solution, Workdate: workdate})
                            .then(workorder => res.redirect('/workOrder') )
                           /* WorkOrders.create({StartDate:startdate,EndDate:enddate,Description:description,
                                Cost:cost,EquipmentCode:equId,ClinicalEnginnerDSSN:engId,Priority:priority})
                                .then(workorder => res.redirect('/workOrder') )*/
                            }
                   })
                }
            
       

                else
                  res.render('error',{layout:false,pageTitle:'Error',href:'/workOrder',message:'Sorry !!! Could Not Get this Engineer'})  
                  
                  
            })
            
        }
        else{
            res.render('error',{layout:false,pageTitle:'Error',href:'/workOrder',message:'Sorry !!! Could Not Get this Equipment'})
        }
    }).catch(err => {
        if(err)
         res.render('error',{layout:false,pageTitle:'Error',href:'/workOrder',message:'Sorry !!! Could Not Add This Work Order '})

          
    })

}


exports.addMaintenance=(req,res)=>{
    code=req.body.Id
    dssn=req.body.DSSN
    startdate=req.body.StartDate
    enddate=req.body.EndDate
    breakdowncode=req.body.BreakDownID
    description=req.body.Description
    var breakdown = null
    BreakDowns.findOne({where:{Code:breakdowncode}}).then(breakdown =>{
        if(breakdown){
            Maintenance.findByPk(code).then(main=>{
                if(main){
                    main.StartDate=startdate
                    main.EndDate=enddate
                    main.BreakDownCode=breakdowncode
                    main.Description=description
                    main.ClinicalEnginnerDSSN=dssn
                    main.save().then(p => res.redirect('/maintenance'))
                }
                else{
                    Maintenance.create({StartDate:startdate,EndDate:enddate,ClinicalEnginnerDSSN:dssn,BreakDownCode:breakdowncode,Description:description})
                    .then(res.redirect('/maintenance'))
                }
        
            })
        }
        else
         return res.render('error',{layout:false,pageTitle:'Error',href:'/maintenance',message:'Sorry !!! Could Not Get this Break down'})
         console.log(err)
        
    }).catch(err=> {
        console.log("ERROR!!!!!!",err)
        })

}
