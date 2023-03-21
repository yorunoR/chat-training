import { createRouter, createWebHistory } from 'vue-router'

// import BoardLayout from '@/layouts/BoardLayout.vue'
import DefaultLayout from '@/layouts/DefaultLayout.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      redirect: '/ping'
    },
    {
      path: '/',
      component: DefaultLayout,
      children: [
        {
          path: 'ping',
          name: 'ping',
          component: async () => await import(/* webpackChunkName: "ping" */ '@/views/PingView.vue')
        },
        {
          path: 'sign_in',
          name: 'sign_in',
          component: async () =>
            await import(/* webpackChunkName: "sign_in" */ '@/views/SignInView.vue')
        }
      ]
    }
    // {
    //   path: '/board',
    //   component: BoardLayout,
    //   children: [
    //     {
    //       path: 'question',
    //       name: 'question',
    //       component: async () =>
    //         await import(
    //           /* webpackChunkName: "question" */ '@/views/board/QuestionView.vue'
    //         )
    //     }
    //   ]
    // }
  ]
})

export default router
