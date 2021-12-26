const Settings = () => {
  const urlHost = "http://toothcare:8888";
  const urlClients = `${urlHost}/api/get_list_clients`;
  const urlDiagnosesList = `${urlHost}/api/get_diagnoses_list`;
  const urlServises = `${urlHost}/api/get_servises_and_products`;
  const urlAuth = `${urlHost}/api/auth/`;

  return { url: { urlClients, urlDiagnosesList, urlServises, urlAuth } };
};

export { Settings };
