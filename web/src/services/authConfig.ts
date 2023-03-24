import swal from 'sweetalert'
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
    didAuthError(error) {
      if (error.graphQLErrors.some((e) => e.message === 'login required!!')) {
        swal({ title: 'Error', text: 'ログインしてください' }).catch((err) => console.error(err))
      }

      return false
    }
  }
}
