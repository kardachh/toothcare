const Settings = () => {
  const urlClients = "http://toothcare:8888/api/get_list_clients";
  const urlDiagnosesList = "http://toothcare:8888/api/get_diagnoses_list";
  const urlServises = "http://toothcare:8888/api/get_servises_and_products";

  return { url: { urlClients, urlDiagnosesList, urlServises } };
};

export { Settings };
