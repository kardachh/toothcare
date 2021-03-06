import { Settings } from "./../settings.js";
const { url } = Settings();

const useFetch = () => {
  const request = (url, params = {}, method = "GET") => {
    let options = {
      method,
    };
    if ("GET" === method) {
      url += "?" + new URLSearchParams(params).toString();
    } else {
      options.body = JSON.stringify(params);
    }

    return fetch(url, options).then((response) => response.json());
  };

  const getClientsData = () => {
    return request(url.urlClients);
  };

  const getDiagnosesData = async (id) => {
    return request(url.urlDiagnosesList, {
      client: id,
    });
  };

  const getServisesData = async () => {
    return request(url.urlServises);
  };

  const getAppointmentData = async () => {
    return request(url.urlAppointment);
  };

  const getEmployeesData = () => {
    return request(url.urlEmployees);
  };

  return {
    api: {
      getClientsData,
      getDiagnosesData,
      getServisesData,
      getAppointmentData,
      getEmployeesData,
    },
  };
};

export { useFetch };
