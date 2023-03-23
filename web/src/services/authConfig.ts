import firebase from '@/services/firebase'

export const authConfig = async (utils) => {
  let token = await firebase.getIdToken()

  return {
    async refreshAuth() {
      token = await firebase.getIdToken()
    },
    willAuthError: () => {
      return true
    },
    addAuthToOperation(operation) {
      if (token == null) {
        return operation
      }

      return utils.appendHeaders(operation, {
        Authorization: `Bearer ${token}`
      })
    },
    didAuthError(_error) {
      return false
    }
  }
}
